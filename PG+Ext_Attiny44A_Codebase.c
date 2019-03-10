/*
 * PGPExt_44A.c
 *
 * Created: 13.08.2018 18:42:17
 * Author : WhoTheHeck
 */ 

/*
PINA:
PINA0 - led_blue_i
PINA1 - led_green_i
PINA2 - led_red_i
PINA3 - motor_manual_o
PINA4 - motor_auto_o
PINA5 - button_o
PINA6 - error_led_o

mode_select (input):
PINB2 == 0 -> autocatch
PINB2 == 1 -> manual catch

PINB0,PINA1,PINA2 - reserved/reprogramming

*/

#include <avr/io.h>                                         // AVR command set
#include <stdint.h>                                         // variable command set
#include <avr/eeprom.h>                                     // EEPROM-access
#include <stdlib.h>
#include <util/delay.h>                                     // _delay_ms()
#include <avr/interrupt.h>                                  // Interrupt command set
#include <avr/power.h>                                      // power mangement, prescaler
#include <avr/sleep.h>                                      // power down

#define MYRAND_MULTIPLIER  17
#define MYRAND_CONSTANT    37
#define EEPROM_DEF 0xFF                                     // ???
#define BODS 7                                              //BOD Sleep bit in MCUCR
#define BODSE 2                                             //BOD Sleep enable bit in MCUCR
#define SIMULATING

uint8_t mcucr1, mcucr2;

uint8_t g_nLastRandom;
uint8_t EEMEM eeSeed;
uint8_t startup = 1;
uint8_t LED_state = 0b00000000;
uint8_t LED_state_n = 0b00000000;
uint8_t LED_state_zero = 0b00000001;
int idle_cnt=0;
int colortracker[3][4];                                     //4 colums for 4 values with 3 colors each
//{{0,0,0,0},
// {0,0,0,0},
// {0,0,0,0}};
uint8_t colorrow;
uint8_t colorcol;
uint8_t pattern;

ISR(PCINT0_vect);
ISR(INT0_vect);

void BlueHandle();
void GreenHandle();
void RedHandle();
void WhiteHandle();
void YellowHandle();

uint8_t MyRandGet();
void GetSeed();
void WaitRand();

void SwitchFunc();
void MotorFunc();

void goToSleep();
void WaitCount();
void TrackReset();


void GetSeed()
{
    uint8_t nSeed;

    nSeed = eeprom_read_byte (&eeSeed);     
    if (nSeed == 255)                                       //incement value by 1 till 255
        nSeed = 1;
    else
        nSeed++;
    
    g_nLastRandom = nSeed;
}

uint8_t MyRandGet() /* credits: mikrocontroller.net/topic/112114 */
{
    //copy into local variables to avoid 16-bit integer expansion
    uint8_t Multiplier = MYRAND_MULTIPLIER;
    uint8_t Constant = MYRAND_CONSTANT;

    //implicit %256 by 8-bit datatype overflow
    g_nLastRandom = (g_nLastRandom * Multiplier + Constant);
    
    if (startup==1)                                         // save first rand-value after startup
        {
            eeprom_update_byte(&eeSeed, g_nLastRandom);     //save new seed EEPROM value
            startup=0;
        }
    
    return g_nLastRandom;
}

void WaitRand()
{
    int i = 0;
    for (i=0;i<(g_nLastRandom+150); i++)                    // values between 0..256, add 150 for realistic wait time
    {
        #ifndef SIMULATING
        _delay_ms(1);
        #endif
    }
    MyRandGet();                                            //get new g_nLastRandom
}

void SwitchFunc()
{
    WaitRand();                                             // wait random time
    PORTA |= (1<<PINA5);                                    // set button_out=high
    WaitRand();
    PORTA &= ~(1<<PINA5);                                   // set button_out=low
    
    #ifndef SIMULATING
    _delay_ms(200);                                         // wait while interrupts are disabled, bc plus often blinks 1 additional time after button press
    #endif
}

void goToSleep()                                            // credits: forum.arduino.cc/index.php?topic=83826.0
{
    cli();                                                  //disable interrupt first; against switch bounce
    GIMSK |= (1<<INT0);                                     //enable INT0
    MCUCR &= ~(1<<(ISC01) | 1<<(ISC00));                    //INT0 on low level

    sleep_enable();
    //turn off the brown-out detector.
    //must have an ATtiny45 or ATtiny85 rev C or later for software to be able to disable the BOD.
    //current while sleeping will be <0.5uA if BOD is disabled, <25uA if not.
    mcucr1 = MCUCR | (1<<BODS) | (1<<BODSE);                //turn off the brown-out detector
    mcucr2 = mcucr1 & ~(1<<BODSE);
    MCUCR = mcucr1;
    MCUCR = mcucr2;
    sei();                                                  //ensure interrupts enabled so we can wake up again
    sleep_cpu();                                            //go to sleep
    cli();                                                  //wake up here, disable interrupts
    //GIMSK = 0x00;                                         //disable INT0
    GIMSK = (1<<PCIE0);                                     //set PCIE Bit for PCINT Interrupt
    PCMSK0 = 0b00000111;                                    //define LED-pins as interrupts
    sleep_disable();
    sei();                                                  //enable interrupts again (but INT0 is disabled from above)
    SwitchFunc();
}

ISR(INT0_vect) {}                                           //nothing to actually do here, the interrupt just wakes us up!

void WaitCount()
{
    // globale var counts how often function gets called, button gets pushed after ~30sec of idling to counteract a situation where GoPlus does not react to new Pokemon or Pokestops until useraction occures
    if (!( PINB & (1<<PINB2) )) idle_cnt=idle_cnt+1;        // count only if autocatching
    #ifndef SIMULATING
    _delay_ms(30);
    #endif                                   
    if (idle_cnt > 1000 && (!( PINB & (1<<PINB2) )) )       // delay 30ms 100 times == 30sec; if autocatching
        {
            WaitRand();                                     // randomize
            SwitchFunc();
            idle_cnt=0;
        }
    if ( PINB & (1<<PINB2) ) goToSleep();                   // sleepmode if PBIN2 == 1
}

void TrackReset()
{
    for(colorrow = 0; colorrow < 3; colorrow++)
    {
        for(colorcol = 0; colorcol < 4; colorcol++)
        colortracker[colorrow][colorcol]=0;
    }
    colorcol=0;
    colorrow=0;
    PORTA &= ~(1<<PINA6);                                   //unset error_LED -> flashing state
}

void BlueHandle()
{
    // first bl -> just register
    if (colorcol==0 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 0))
    {
        colorrow=0;                                     //set state==blue
        colortracker[colorrow][colorcol]=1;             //set state==blue
        colorcol=colorcol+1;                            //incement column
        PORTA &= ~(1<<PINA6);                           //set error_led=low
    }
    // bl, bl -> switch
    else if (colorcol==1 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 0))
    {
        colorrow=0;
        colortracker[colorrow][colorcol]=1;
        colorcol=colorcol+1;
        SwitchFunc();
    }
    // bl, bl, bl -> seach for device == disconnected, error!
    else if (colorcol>=2 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 0))
    {
        PORTA |= (1<<PINA6);                            //set error_led=high
        //switchfunc has already been activated after bl-bl state, so wait, reset, check again:
        #ifndef SIMULATING
        _delay_ms(1000);                                // 1 sec bc wait for human action
        #endif
        TrackReset();                                   // reset colortracker, start over, see if still disconected
    }
    // other
    else
    {
        TrackReset();
        PORTA &= ~(1<<PINA6);
    }
    LED_state=0;
    sei();
}

void GreenHandle()
{
    // first gr -> switch
    if (colorcol==0 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 0))
    {
        colorrow=1;                                     //set state==green
        colortracker[colorrow][colorcol]=1;             //set state==green
        colorcol=colorcol+1;                            //incement column
        PORTA &= ~(1<<PINA6);                           //set error_led=low
        SwitchFunc();
    }
    //bl, gr -> delete matrix | or other
    else
    {
        TrackReset();
        PORTA &= ~(1<<PINA6);                           //set error_led=low
    }
    LED_state=0;
    sei();
}

void RedHandle()
{
    // r -> disconnect or no signal
    if (colorcol==0 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 0))
    {
        PORTA |= (1<<PINA6);                            //set error_led=high
    }
    // gr, w, w, w, r or gr, w, w, r or gr, w, r -> end of catch-event
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 1 && colortracker[2][colorcol-1] == 1))
    {
        TrackReset();
        PORTA &= ~(1<<PINA6);
    }
    // gr, r -> storage full
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 0 && colortracker[1][colorcol-1] == 1 && colortracker[2][colorcol-1] == 0))
    {
        PORTA |= (1<<PINA6);
        TrackReset();
    }
    // b, r -> stop out of reach
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 0))
    {
        TrackReset();
        PORTA &= ~(1<<PINA6);
    }
    //other
    else
    {
        TrackReset();
        PORTA &= ~(1<<PINA6);
    }
    LED_state=0;
    sei();
}

void WhiteHandle()
{
    // gr, w -> save state
    if (colorcol>0 && (colortracker[0][colorcol-1] == 0 && colortracker[1][colorcol-1] == 1 && colortracker[2][colorcol-1] == 0))
    {
        for(colorrow = 0; colorrow < 3; colorrow++)     //set state==white
        {
            colortracker[colorrow][colorcol]=1;
        }
        colorcol=colorcol+1;                            //incement column
        PORTA &= ~(1<<PINA6);                           //set error_led=low
    }
    // w, w -> save state
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 1 && colortracker[2][colorcol-1] == 1))
    {
        for(colorrow = 0; colorrow < 3; colorrow++)
        {
            colortracker[colorrow][colorcol]=1;
        }
        colorcol=colorcol+1;
        PORTA &= ~(1<<PINA6);
    }
    // b, w -> bag full -> orange LED
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 0))
    {
        PORTA |= (1<<PINA6);                            //set error_led=high
        TrackReset();
    }
    // other
    else
    {
        TrackReset();
        PORTA &= ~(1<<PINA6);
    }
    LED_state=0;
    sei();
}

void YellowHandle()
{
    // first yellow -> new mon!
    if (colorcol==0 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 0))
    {
        TrackReset();
        //maybe signal to user or use switch to decide if catch auto or manual. for now do nothing -> manual catch
        PORTA &= ~(1<<PINA6);                           //set error_led=low
    }
    // other
    else
    {
        TrackReset();
        PORTA &= ~(1<<PINA6);
    }
    LED_state=0;
    sei();
}

void MotorFunc();
{
    switch (pattern) {
        case 0: //startup
        case 1: //search device
        case 2: //disconnected or no service
        case 3: //pokemon storage full
        case 4: //bag full
        case 5: //new pokemon
        case 6: //other
        //default: break;
    }
}

ISR(PCINT0_vect)
{
    if (PINA & (1<<PINA0) )
        LED_state_n |= (1<<0);
    else LED_state_n &= ~(1<<0);
    if (PINA & (1<<PINA1) )
        LED_state_n |= (1<<1);
    else LED_state_n &= ~(1<<1);
    if (PINA & (1<<PINA2) )
        LED_state_n |= (1<<2);
    else LED_state_n &= ~(1<<2);

    if (LED_state_n != 0                                    //save state only if change from 0 to 1
        && LED_state_zero == 1                              // -> skips saving catch/spin successful-LED-flashing
        && ( !(PINB & (1<<PINB2) )) )
        {
            LED_state = LED_state_n;
            LED_state_zero = 0;
            cli();                                          //disable ISR for now
        }
    if (LED_state_n == 0) LED_state_zero = 1;               //remember that there was a change to "LEDs==off" -> shows that there is not a "success"-flashing happening
    idle_cnt=0;                                             //reset idle counter
}

int main(void)
{
    //first of all: stuff to save power!
    ACSR |= (1<<ACD);                                       //disable the analog comparator
    ADCSRA &= ~(1<<ADEN);                                   //disable ADC
    set_sleep_mode(SLEEP_MODE_PWR_DOWN);
    //clock_prescale_set(clock_div_256);                        // clk prescale -> 8MHz/256 -> less clk == less power -> results in problem with delay-function
    
    //DDRx
    DDRA = 0b01111000;
    DDRB = 0b00000000;
    
    //PORTx
    PORTA = 0b00000000;
    PORTB = 0b00000100;                                     //startconfig: all out=low; mode_select pullup enable
    PORTA &= ~(1<<PINA5);                                   //set button_out=low
    PORTA &= ~(1<<PINA6);                                   //set error_led=low
    
    //ISR management
    GIMSK = (1<<PCIE0);                                     //enable PCINT Interrupt
    PCMSK0 = 0b00000111;                                        //define LED-pins as interrupts
    
    GetSeed();                                              //globale Variable g_nLastRandom belegen
    TrackReset();
    SwitchFunc();

    sei();                                                  //enable interrupts
    
    while (1) {         
        switch (LED_state) {
            case 0: WaitCount(); break;                     //handle waiting
            case 1: BlueHandle(); break;                    //blue LED -> Poke-Stop
            case 2: GreenHandle(); break;                   //green LED -> Mon-Catch
            case 4: RedHandle(); break;                     //red LED -> Error
            case 6: YellowHandle(); break;                  //yellow LED -> new mon
            case 7: WhiteHandle(); break;                   //white LED -> catching or bag full
            //default: break;
        }
    }
}

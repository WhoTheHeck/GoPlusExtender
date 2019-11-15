/*
 * PGPExt_44A.c
 *
 * Created: 13.08.2018 18:42:17
 * Author : WhoTheHeck
 */ 

/*
11 IOs verfügbar
!! PINB2 == INT0 !!

PINA:
PINA0 - led_blue_i
PINA1 - led_green_i
PINA2 - led_red_i
PINA3 - motor_manual_o low enable
PINA4 - motor_auto_o   high enable
PINA0 - button_o
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
#define EEPROM_DEF 0xFF
//#define SIMULATING
//#define DEBUGING

uint8_t mcucr1, mcucr2;

uint8_t g_nLastRandom;
uint8_t EEMEM eeSeed;
uint8_t startup = 1;
uint8_t LED_state = 0b00000000;
uint8_t LED_state_n = 0b00000000;
uint8_t LED_state_zero = 0b00000001;
uint16_t idle_cnt=0;
uint16_t colortracker[3][8];                                        //8 colums for 8 values with 3 colors each
uint8_t colorrow;
uint8_t colorcol;
uint8_t pattern=0b000;
uint8_t battime = 0;
float BatVal;
float EEMEM eeBatVal;


ISR(PCINT0_vect);
ISR(TIM1_COMPA_vect);
ISR(EXT_INT0_vect);

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

void adc_init();
void adc_disable();
void batt_meas();
void batt_state();


void GetSeed()
{
    uint8_t nSeed;
    
    #ifndef SIMULATING
    nSeed = eeprom_read_byte (&eeSeed);     
    #else
    nSeed = 0;
    #endif
    
    if (nSeed == 255)                                       //incement value by 1 till 255
        nSeed = 1;
    else
        nSeed++;
    
    #ifndef SIMULATING
    eeprom_busy_wait(); 
    eeprom_write_byte(&eeSeed,nSeed);                       //write new eeprom value
    #endif

    g_nLastRandom = nSeed;
}

uint8_t MyRandGet() /* credits: mikrocontroller.net/topic/112114 */
{
    //copy into local variables to avoid 16-bit integer expansion
    uint8_t Multiplier = MYRAND_MULTIPLIER;
    uint8_t Constant = MYRAND_CONSTANT;

    //implicit %256 by 8-bit datatype overflow
    g_nLastRandom = (g_nLastRandom * Multiplier + Constant)/* % MYRAND_MODULO*/;
    
    if (startup==1)                                         // save first rand-value after startup
        {
            #ifndef SIMULATING
            eeprom_update_byte(&eeSeed, g_nLastRandom);     //save new seed EEPROM value
            #endif
            startup=0;
        }
    
    return g_nLastRandom /* % MYRAND_MODULO*/;
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
    PORTA |= (1<<PINA0);                                    // set button_out=high
    #ifdef DEBUGING
    PORTA |= (1<<PINA6);                                    // led for debug
    #endif
    WaitRand();
    PORTA &= ~(1<<PINA0);                                   // set button_out=low
    #ifdef DEBUGING
    PORTA &= ~(1<<PINA6);
    #endif
}

void goToSleep()                                            // credits: forum.arduino.cc/index.php?topic=83826.0
{
    set_sleep_mode(SLEEP_MODE_PWR_DOWN);
    cli();                                                  //disable interrupt first; against switch bounce
    PORTA &= ~(1<<PINA5);                                   //make sure low power led is off
    PORTB &= ~(1<<PINB0);                                   //PINB0 low - standard motor mode
    power_all_disable ();                                   //turn off all modules
    battime = 0;                                            //reset battery/adc timer counter
    GIMSK = (1<<INT0);                                      //enable INT0
    MCUCR &= ~(1<<(ISC01) | 1<<(ISC00));                    //INT0 on low level

    sleep_enable();
    sleep_bod_disable();                                    //turn off the brown-out detector.
    sei();                                                  //ensure interrupts enabled so we can wake up again
    sleep_cpu();                                            //go to sleep
    sleep_disable();
    cli();                                                  //wake up here, disable interrupts
    GIMSK = (1<<PCIE0);                                     //setze PCIE Bit um PCINT Interrupt zu aktivieren
    PCMSK0 = 0b00001110;                                    //define LED-pins as interrupts
    batt_meas();                                            //measure batvoltage
    PORTB |= (1<<PINB0);                                    //PINB0 high - motor disconnected from Go+
    sei();                                                  //enable interrupts again (but INT0 is disabled from above)
    power_timer1_enable();                                  //enable battery/adc counter
    SwitchFunc();
}

ISR(EXT_INT0_vect) {}                                       //nothing to actually do here, the interrupt just wakes us up!

void WaitCount()
{
    // global var counts how often function gets called, button gets pushed after ~30sec of idling to counteract a situation
	// where GoPlus does not react to new Pokemon or Pokestops until useraction occures
    if (!( PINB & (1<<PINB2) )) idle_cnt=idle_cnt+1;        // count only if autocatching
    #ifndef SIMULATING
    _delay_ms(30);
    #endif                                   
    if (idle_cnt > 1000 && (!( PINB & (1<<PINB2) )) )       // delay 30ms 100 times == 30sec; if autocatching
        {
            WaitRand();                                     // randomize
            SwitchFunc();
            TrackReset();
            idle_cnt=0;
        }
    if ( PINB & (1<<PINB2) )                                // sleepmode if PBIN2 == 1
        {
            TrackReset();
            goToSleep();
        }
}

void TrackReset()
{
    for(colorrow = 0; colorrow < 3; colorrow++)
    {
        for(colorcol = 0; colorcol < 8; colorcol++)
        colortracker[colorrow][colorcol]=0;
    }
    colorcol=0;
    colorrow=0;
    PORTA &= ~(1<<PINA6);                                   //unset error_LED -> flashing state
}

void BlueHandle()
{
    // first bl -> just register || counteract handling of successfull catch event
    if ((colorcol==0 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 0))
    || (colorcol==1 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 1)))
    {
        TrackReset();
        colorrow=0;                                     	//set state==blue
        colortracker[colorrow][colorcol]=1;             	//set state==blue
        colorcol=colorcol+1;                            	//incement column
        PORTA &= ~(1<<PINA6);                           	//set error_led=low
    }
    // bl, bl -> switch
    else if (colorcol==1 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 0))
    {
        colorrow=0;
        colortracker[colorrow][colorcol]=1;
        colorcol=colorcol+1;
        SwitchFunc();
    }
    //bl, bl, bl -> maybe just second blink after buttonpush
    else if ((colorcol==2 || colorcol==3) && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 0))
    {
        colorrow=0;
        colortracker[colorrow][colorcol]=1;
        colorcol=colorcol+1;
    }
    // bl, bl, bl, bl -> seach for device == disconnected, error!
    else if (colorcol==4 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 0))
    {
        PORTA |= (1<<PINA6);                            	//set error_led=high
        //switchfunc has already been activated after bl-bl state, so wait, reset, check again:
        #ifndef SIMULATING
        _delay_ms(1000);                                	// 1 sec bc wait for human action
        #endif
        TrackReset();                                   	// reset colortracker, start over, see if still disconected
        pattern=0b111;//1;
        MotorFunc();
    }
    // other
    else
    {
        TrackReset();
        PORTA |= (1<<PINA6);
        pattern=0b001;//6;
        MotorFunc();
    }
    LED_state=0;
    sei();
}

void GreenHandle()
{
    // first gr -> switch   || counteract handling of successfull catch event
    if ((colorcol==0 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 0))
    || (colorcol==1 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 1)))
    {
        colorrow=1;                                     	//set state==green
        colortracker[colorrow][colorcol]=1;             	//set state==green
        colorcol=colorcol+1;                            	//incement column
        PORTA &= ~(1<<PINA6);                           	//set error_led=low
        SwitchFunc();
    }
    // gr, gr -> maybe just second blink after buttonpush
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 0 && colortracker[1][colorcol-1] == 1 && colortracker[2][colorcol-1] == 0))
    {
        colorrow=1;
        colortracker[colorrow][colorcol]=1;
        colorcol=colorcol+1;
    }
    //bl, gr -> spin successful -> delete matrix
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 0))
    {
        PORTA &= ~(1<<PINA6);
        TrackReset();
    }
    //other
    else
    {
        TrackReset();
        PORTA |= (1<<PINA6);
        pattern=0b001;//6;
        MotorFunc();
    }
    LED_state=0;
    sei();
}

void RedHandle()
{
    // r -> disconnect or no signal
    if (colorcol==0 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 0))
    {
        PORTA |= (1<<PINA6);                            	//set error_led=high
        TrackReset();
        pattern=0b000;//2;
        MotorFunc();
    }
    // gr, w, w, w, r or gr, w, w, r or gr, w, r -> end of catch-event
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 1 && colortracker[1][colorcol-1] == 1 && colortracker[2][colorcol-1] == 1))
    {
        TrackReset();
        colorrow=2;
        colortracker[colorrow][colorcol]=1;
        colorcol=colorcol+1;
    }
    //r, r -> 2nd red after catch-fail
    else if (colorcol==1 && (colortracker[0][colorcol-1] == 0 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 1))
    {
        colorrow=2;
        colortracker[colorrow][colorcol]=1;
        colorcol=colorcol+1;
    }
    //r, r, r -> 3rd red after catch-fail - reset
    else if (colorcol==2 && (colortracker[0][colorcol-1] == 0 && colortracker[1][colorcol-1] == 0 && colortracker[2][colorcol-1] == 1))
    {
        TrackReset();
        PORTA &= ~(1<<PINA6);
    }
    // gr, r -> storage full
    else if (colorcol>0 && (colortracker[0][colorcol-1] == 0 && colortracker[1][colorcol-1] == 1 && colortracker[2][colorcol-1] == 0))
    {
        PORTA |= (1<<PINA6);
        TrackReset();
        pattern=0b100;//3;
        MotorFunc();
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
        PORTA |= (1<<PINA6);
        pattern=0b001;//6;
        MotorFunc();
    }
    LED_state=0;
    sei();
}

void WhiteHandle()
{
    // gr, w -> save state
    if (colorcol>0 && (colortracker[0][colorcol-1] == 0 && colortracker[1][colorcol-1] == 1 && colortracker[2][colorcol-1] == 0))
    {
        for(colorrow = 0; colorrow < 3; colorrow++)     	//set state==white
        {
            colortracker[colorrow][colorcol]=1;
        }
        colorcol=colorcol+1;                            	//incement column
        PORTA &= ~(1<<PINA6);                           	//set error_led=low
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
        PORTA |= (1<<PINA6);                            	//set error_led=high
        TrackReset();
        pattern=0b110;//4;
        MotorFunc();
    }
    // other
    else
    {
        TrackReset();
        PORTA |= (1<<PINA6);
        pattern=0b001;//6;
        MotorFunc();
    }
    LED_state=0;
    sei();
}

void YellowHandle()
{
    // first yellow -> new mon!   || counteract handling of successfull catch event
    if ((colorcol==0 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 0))
    ||  (colorcol==1 && (colortracker[0][0] == 0 && colortracker[1][0] == 0 && colortracker[2][0] == 1)))

    {
        TrackReset();
        //maybe signal to user or use switch to decide if catch auto or manual. for now only indicate to manual catch
        PORTA |= (1<<PINA6);                            	//set error_led=high
        pattern=0b101;//5;
        MotorFunc();
    }
    // other
    else
    {
        TrackReset();
        PORTA |= (1<<PINA6);
        pattern=0b001;//6;
        MotorFunc();
    }
    LED_state=0;
    sei();
}

void MotorFunc()
{
    uint16_t d_short = 200;
    uint16_t d_long = 400;
    uint16_t d_sleep = 100;
    uint8_t i=0;
    
    for (i=0;i<3;i++)
        {
            PORTB |= (1<<PINB1);
            if (pattern & (1<<i) )  
            {
                #ifndef SIMULATING
                _delay_ms(d_long);
                #endif
            }
            else
                #ifndef SIMULATING
                _delay_ms(d_short);
                #endif
            PORTB &= ~(1<<PINB1);
            #ifndef SIMULATING
            _delay_ms(d_sleep);
            #endif
        }
    //pattern=0;
}

ISR(PCINT0_vect)
{
    if (PINA & (1<<PINA1) )                                 //ledb
        LED_state_n |= (1<<0);
    else LED_state_n &= ~(1<<0);
    if (PINA & (1<<PINA2) )                                 //ledg
        LED_state_n |= (1<<1);
    else LED_state_n &= ~(1<<1);
    if (PINA & (1<<PINA3) )                                 //ledr
        LED_state_n |= (1<<2);
    else LED_state_n &= ~(1<<2);

    if (LED_state_n != 0                                    //Variable nur speichern, wenn nicht Wechsel auf 0 erfolgte
        && LED_state_zero == 1                              //nur speichern wenn vorher zustand 0 war (Vermeidung von Erfolg-Flash-Folge)
        && ( !(PINB & (1<<PINB2) )) )
        {
            LED_state = LED_state_n;
            LED_state_zero = 0;
            //cli();                                          //disable ISR - shouldn't have affect in ISR!
        }
    if (LED_state_n == 0) LED_state_zero = 1;               //remember that there was a change to "LEDs==off" -> shows that there is not a "success"-flashing happening
    idle_cnt=0;                                             //reset idle counter
}

ISR(TIM1_COMPA_vect)
{
    //if (battime == 55)
    //{
        //battime = 0;
        //batt_meas();
    //}
    battime++;
}

void batt_meas()
{   
    uint16_t adcval = 0;
    
    adc_init();
    //#ifndef SIMULATING
    //_delay_ms(1);
    //#endif
        
    if (!(ADCSRA & (1<<ADSC) ))                             //is conversion running?
        {
            ADCSRA |= (1<<ADSC);                            //start conversion
            while (!(ADCSRA & (1<<ADIF)))
            {}
            adcval=ADC;
            ADCSRA |= (1<<ADIF);                        	//delete flag
                
            //battvolt=((adcval*4.48938)/1024);               // value based on simulation
            BatVal=((adcval*4.41)/1024);                    // 3*1.47 == Refvolt*R_divider
            if (BatVal<3.2 && BatVal>=3.1)
            {
                PORTA |= (1<<PINA5);
            }
            else
                PORTA &= ~(1<<PINA5);
        }
    #ifndef SIMULATING
    eeprom_busy_wait(); 
    //eeprom_write_byte(&eeBatVal,(BatVal-2)*100); // byte instead of float would reduce memsize
    eeprom_write_float(&eeBatVal,BatVal);
    #endif
    adc_disable();
}

void batt_state()
{
    //BatVal = (eeprom_read_byte(&eeBatVal)/100+2);
    #ifndef SIMULATING
    BatVal = eeprom_read_float(&eeBatVal);
    #else
    BatVal=3;
    #endif
    if ((BatVal < 3.2) && (BatVal >= 3.1))
    {
        PORTA |= (1<<PINA5);
    }
    else PORTA &= ~(1<<PINA5);
}

void adc_disable()
{
    ADCSRA &= ~(1<<ADEN); 
    power_adc_disable();
}

void adc_init()
{
    power_adc_enable();
    ADCSRA |= (1<<ADEN);                                        //enable ADC
    ADMUX &= ~((1<<REFS0) | (1<<REFS1) | (1<<MUX4) | (1<<MUX5));//high2: Vcc as Ref; lower6: ADC7 as in
    ADMUX |= (1<<MUX0) | (1<<MUX1) | (1<<MUX2);
    #ifndef SIMULATING
    ADCSRA |= (1<<ADPS0) | (1<<ADPS1) | (1<<ADPS2);             //adc clock prescale 1MHz/128=7.8kHz | 8MHz/128=62.5kHz
    //_delay_ms(1);
    #endif
    while (ADCSRA & (1<<ADSC) ) {                               // wait for completed conversion
    }
    (void) ADC;                                                 // have to read ADC once for valid results
    ADCSRA |= (1<<ADIF);
}

int main(void)
{   
    //DDRx - datadirection
    DDRA = 0b01100001;
    DDRB = 0b00000011;
    
    //PORTx - outputs / input pullups
    PORTA = 0b00000000;                                     //startconfig: all out=low
    PORTB = 0b00000101;                                     //startconfig: most out=low, but motor-man; mode_select pullup enable
    
    //ISR management
    GIMSK = (1<<PCIE0);                                     //enable PCINT Interrupt
    //PCMSK = 0b00000111;                                   //define LED-pins as interrupts
    PCMSK0 = 0b00001110;                                    //define LED-pins as interrupts
    
    #ifndef SIMULATING
    TCCR1B = 1<<CS12 | 0<<CS11 | 1<<CS10 | 1<<WGM12;        //1024 prescale; CTC mode
    #endif
    #ifdef SIMULATING
    TCCR1B = 0<<CS12 | 0<<CS11 | 1<<CS10 | 1<<WGM12;        //no prescale; CTC mode
    #endif
    OCR1A = 63920;                                          //counter compare value; compare*55 == 1h wait
    TIMSK1 |= (1<<OCIE1A);                                  //compare ISR

    #ifndef SIMULATING
    _delay_ms(1000);                                        //1s for full init
    #endif
    MotorFunc();
    GetSeed();                                              //set global variable g_nLastRandom
    TrackReset();
    batt_meas();
    SwitchFunc();
    
    sei();                                                  //enable interrupts
    
    //do your thing!
    while (1) {
        switch (LED_state) {
            case 0: WaitCount(); break;                     //handle waiting
            case 1: cli(); BlueHandle(); break;             //blue LED -> Poke-Stop
            case 2: cli(); GreenHandle(); break;            //green LED -> Mon-Catch
            case 4: cli(); RedHandle(); break;              //red LED -> Error
            case 6: cli(); YellowHandle(); break;           //yellow LED -> new mon
            case 7: cli(); WhiteHandle(); break;             //white LED -> catching or bag full
            //default: break;
        }
        #ifdef DEBUGING
            PORTA |= (1<<PINA6);                            //operation indication for debug
            #ifndef SIMULATING
            _delay_ms(8);
            #endif
            PORTA &= ~(1<<PINA6);
        #endif
        if (battime>=55)
        {
            batt_meas();
            battime=0;
        }        
    }
}
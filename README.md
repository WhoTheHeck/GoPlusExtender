# GoPlusExtender

## Gliederung
- Idea
- Concept
- Schematic
- Layout
- Assembly
- Codebase

## Idea
The goal of this project was to have Go Plus modded in a way where it behaves comparable to the simple mod where you solder the vibration motor to the switch. In that simple mod basically everytime you plus would vibrate it will push the button automatically. At the end this results in constant button presses which on one hand drains the battery and on the other hand also always will push the button in events like "catch/spin succesfull", "item bag full", "connection-errors", etc.
This project aims to react to Go Plus events in a smart way. Only pushing the button when it is necassary. While implementing that there were other convinient features addied like a rechargable LiPo-battery, low battery indicator, manual/automatic mode select, power save functionalities, change to manual catch mode for new pokemon and -very handy- custom vibration motor control! That enables custom vibration patterns which vibrate the motor in automation mode only when e.q. Go Plus disconnects from smartphone, item bag full or pokemon storage full.

## Concept
hooking into LED driving transistors to analize patterns
ATTiny45 reads LED signals, processes them, controlls button and vibration motor.

## Schematic

## Layout

## Assembly
### PCB

### Go Plus Solderpoints

### Wiring

## Codebase

### LED analizer functions
BlueHandle()
GreenHandle()
RedHandle()
WhiteHandle()
YellowHandle()
--- ? ---
WaitCount()
TrackReset()

### Randomized wait functions
MyRandGet()
GetSeed()
WaitRand()

### Switch and motor control functions
SwitchFunc()
MotorFunc()

### Power save / deep sleep functions
goToSleep()
adc_init()
adc_disable()

### Battery monitoring functions
batt_meas();
batt_state();

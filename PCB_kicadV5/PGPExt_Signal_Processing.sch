EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "PG+Ext"
Date "2019-03-10"
Rev "1.0"
Comp "u/WhoTheHeck808"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:TestPoint W10
U 1 1 5B4DFD91
P 1650 4400
F 0 "W10" V 1650 4650 50  0000 C CNN
F 1 "LEDb_i" V 1750 4500 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 1850 4400 50  0001 C CNN
F 3 "" H 1850 4400 50  0000 C CNN
	1    1650 4400
	0    -1   -1   0   
$EndComp
$Comp
L additional_parts:D_Schottky_Dual D2
U 1 1 5B4DFDBB
P 2450 4400
F 0 "D2" H 2450 4300 60  0000 C CNN
F 1 "D_Schottky_Dual" H 2475 4275 60  0001 C CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 2450 4400 60  0001 C CNN
F 3 "http://www.produktinfo.conrad.com/datenblaetter/125000-149999/140681-da-01-en-SCHOTTKY_DIODE_RB481KTL_SOT_343.pdf" H 2450 4400 60  0001 C CNN
	1    2450 4400
	-1   0    0    1   
$EndComp
$Comp
L additional_parts:D_Schottky_Dual D2
U 2 1 5B4EC72E
P 6050 4400
F 0 "D2" H 6050 4300 60  0000 C CNN
F 1 "D_Schottky_Dual" H 6075 4275 60  0001 C CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 6050 4400 60  0001 C CNN
F 3 "http://www.produktinfo.conrad.com/datenblaetter/125000-149999/140681-da-01-en-SCHOTTKY_DIODE_RB481KTL_SOT_343.pdf" H 6050 4400 60  0001 C CNN
	2    6050 4400
	-1   0    0    1   
$EndComp
Text Label 5600 1550 2    60   ~ 0
LEDb
Text Label 5600 1650 2    60   ~ 0
LEDg
Text Label 5600 1750 2    60   ~ 0
LEDr
Text Notes 9600 2000 2    60   ~ 0
LEDb - in\nLEDg - in\nLEDr - in\nmotor_manual - out\nmotor_auto - out\nswitch - out\nmode select - in\nw/ internal pullup 
$Comp
L Device:C C5
U 1 1 5B4F597E
P 3500 1950
F 0 "C5" H 3525 2050 50  0000 L CNN
F 1 "100n" H 3525 1850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3538 1800 50  0001 C CNN
F 3 "" H 3500 1950 50  0000 C CNN
	1    3500 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5B4F5985
P 3500 3100
F 0 "#PWR028" H 3500 2850 50  0001 C CNN
F 1 "GND" H 3500 2950 50  0000 C CNN
F 2 "" H 3500 3100 50  0000 C CNN
F 3 "" H 3500 3100 50  0000 C CNN
	1    3500 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 5B4F598B
P 6550 3100
F 0 "#PWR031" H 6550 2850 50  0001 C CNN
F 1 "GND" H 6550 2950 50  0000 C CNN
F 2 "" H 6550 3100 50  0000 C CNN
F 3 "" H 6550 3100 50  0000 C CNN
	1    6550 3100
	1    0    0    -1  
$EndComp
Text Notes 9600 2750 2    60   ~ 0
orange LED for\nerror occurences
Text Label 5650 2550 2    60   ~ 0
mode_select
$Comp
L Device:R R10
U 1 1 5B4F599A
P 6550 2450
F 0 "R10" V 6630 2450 50  0000 C CNN
F 1 "220" V 6550 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6480 2450 50  0001 C CNN
F 3 "" H 6550 2450 50  0000 C CNN
	1    6550 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_ALT D3
U 1 1 5B4F59A8
P 6550 2800
F 0 "D3" V 6550 2950 50  0000 C CNN
F 1 "LED_red" V 6350 3000 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 6550 2800 50  0001 C CNN
F 3 "" H 6550 2800 50  0001 C CNN
	1    6550 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 2100 3500 3000
Wire Wire Line
	3500 3000 3500 3100
Connection ~ 3500 3000
Wire Wire Line
	5050 1450 5700 1450
Wire Wire Line
	5050 1550 5600 1550
Wire Wire Line
	5050 1650 5600 1650
Wire Wire Line
	5050 1750 5600 1750
$Comp
L power:VDD #PWR027
U 1 1 5B4F59C9
P 3200 1000
F 0 "#PWR027" H 3200 850 50  0001 C CNN
F 1 "VDD" H 3200 1140 50  0000 C CNN
F 2 "" H 3200 1000 50  0001 C CNN
F 3 "" H 3200 1000 50  0001 C CNN
	1    3200 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5B539851
P 2650 4800
F 0 "C4" H 2700 4900 50  0000 L CNN
F 1 "47n" H 2660 4720 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2650 4800 50  0001 C CNN
F 3 "" H 2650 4800 50  0001 C CNN
	1    2650 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5B5398DC
P 2900 4650
F 0 "R5" H 3000 4750 50  0000 C CNN
F 1 "10k" V 2900 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 4650 50  0001 C CNN
F 3 "" H 2900 4650 50  0000 C CNN
	1    2900 4650
	1    0    0    -1  
$EndComp
$Comp
L additional_parts:D_Schottky_Dual D4
U 1 1 5B53A435
P 9500 4400
F 0 "D4" H 9500 4300 60  0000 C CNN
F 1 "D_Schottky_Dual" H 9525 4275 60  0001 C CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 9500 4400 60  0001 C CNN
F 3 "http://www.produktinfo.conrad.com/datenblaetter/125000-149999/140681-da-01-en-SCHOTTKY_DIODE_RB481KTL_SOT_343.pdf" H 9500 4400 60  0001 C CNN
	1    9500 4400
	-1   0    0    1   
$EndComp
$Comp
L additional_parts:D_Schottky_Dual D4
U 2 1 5B53A43B
P 10450 6350
F 0 "D4" H 10450 6250 60  0000 C CNN
F 1 "D_Schottky_Dual" H 10475 6225 60  0001 C CNN
F 2 "Package_TO_SOT_SMD:SOT-343_SC-70-4" H 10450 6350 60  0001 C CNN
F 3 "http://www.produktinfo.conrad.com/datenblaetter/125000-149999/140681-da-01-en-SCHOTTKY_DIODE_RB481KTL_SOT_343.pdf" H 10450 6350 60  0001 C CNN
	2    10450 6350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 5B53A810
P 2100 4400
F 0 "R4" V 2180 4400 50  0000 C CNN
F 1 "1k" V 2100 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2030 4400 50  0001 C CNN
F 3 "" H 2100 4400 50  0000 C CNN
	1    2100 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 4400 1950 4400
Wire Wire Line
	2250 4400 2350 4400
$Comp
L power:GND #PWR026
U 1 1 5B53CB64
P 2900 5300
F 0 "#PWR026" H 2900 5050 50  0001 C CNN
F 1 "GND" H 2900 5150 50  0000 C CNN
F 2 "" H 2900 5300 50  0000 C CNN
F 3 "" H 2900 5300 50  0000 C CNN
	1    2900 5300
	1    0    0    -1  
$EndComp
Text Label 3300 4850 2    60   ~ 0
LEDb
Text Label 6900 4850 2    60   ~ 0
LEDg
Text Label 10350 4850 2    60   ~ 0
LEDr
$Comp
L Device:R R6
U 1 1 5B541446
P 2900 5050
F 0 "R6" H 3000 5150 50  0000 C CNN
F 1 "100k" V 2900 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 5050 50  0001 C CNN
F 3 "" H 2900 5050 50  0000 C CNN
	1    2900 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5B541556
P 2650 5300
F 0 "#PWR025" H 2650 5050 50  0001 C CNN
F 1 "GND" H 2650 5150 50  0000 C CNN
F 2 "" H 2650 5300 50  0000 C CNN
F 3 "" H 2650 5300 50  0000 C CNN
	1    2650 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4400 2650 4400
Wire Wire Line
	2650 4400 2900 4400
Wire Wire Line
	2650 4400 2650 4700
Wire Wire Line
	2650 4900 2650 5300
Wire Wire Line
	2900 5300 2900 5200
Wire Wire Line
	2900 4800 2900 4850
Wire Wire Line
	2900 4850 2900 4900
Wire Wire Line
	2900 4850 3300 4850
Connection ~ 2900 4850
Wire Wire Line
	2900 4400 2900 4500
Connection ~ 2650 4400
$Comp
L Connector:TestPoint W16
U 1 1 5B542FFC
P 5250 4400
F 0 "W16" V 5250 4650 50  0000 C CNN
F 1 "LEDg_i" V 5350 4500 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5450 4400 50  0001 C CNN
F 3 "" H 5450 4400 50  0000 C CNN
	1    5250 4400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5B543008
P 6250 4800
F 0 "C6" H 6300 4900 50  0000 L CNN
F 1 "47n" H 6260 4720 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6250 4800 50  0001 C CNN
F 3 "" H 6250 4800 50  0001 C CNN
	1    6250 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5B54300E
P 6500 4650
F 0 "R8" H 6600 4750 50  0000 C CNN
F 1 "10k" V 6500 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6430 4650 50  0001 C CNN
F 3 "" H 6500 4650 50  0000 C CNN
	1    6500 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5B543014
P 5700 4400
F 0 "R7" V 5780 4400 50  0000 C CNN
F 1 "1k" V 5700 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5630 4400 50  0001 C CNN
F 3 "" H 5700 4400 50  0000 C CNN
	1    5700 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 4400 5550 4400
Wire Wire Line
	5850 4400 5950 4400
$Comp
L power:GND #PWR030
U 1 1 5B54301C
P 6500 5300
F 0 "#PWR030" H 6500 5050 50  0001 C CNN
F 1 "GND" H 6500 5150 50  0000 C CNN
F 2 "" H 6500 5300 50  0000 C CNN
F 3 "" H 6500 5300 50  0000 C CNN
	1    6500 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5B543023
P 6500 5050
F 0 "R9" H 6600 5150 50  0000 C CNN
F 1 "100k" V 6500 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6430 5050 50  0001 C CNN
F 3 "" H 6500 5050 50  0000 C CNN
	1    6500 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5B543029
P 6250 5300
F 0 "#PWR029" H 6250 5050 50  0001 C CNN
F 1 "GND" H 6250 5150 50  0000 C CNN
F 2 "" H 6250 5300 50  0000 C CNN
F 3 "" H 6250 5300 50  0000 C CNN
	1    6250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4400 6250 4400
Wire Wire Line
	6250 4400 6500 4400
Wire Wire Line
	6250 4400 6250 4700
Wire Wire Line
	6250 4900 6250 5300
Wire Wire Line
	6500 4400 6500 4500
Connection ~ 6250 4400
$Comp
L Connector:TestPoint W18
U 1 1 5B54338B
P 8700 4400
F 0 "W18" V 8700 4650 50  0000 C CNN
F 1 "LEDr_i" V 8800 4500 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 8900 4400 50  0001 C CNN
F 3 "" H 8900 4400 50  0000 C CNN
	1    8700 4400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5B543391
P 9700 4800
F 0 "C7" H 9750 4900 50  0000 L CNN
F 1 "47n" H 9710 4720 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9700 4800 50  0001 C CNN
F 3 "" H 9700 4800 50  0001 C CNN
	1    9700 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5B543397
P 9950 4650
F 0 "R12" H 10050 4750 50  0000 C CNN
F 1 "10k" V 9950 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9880 4650 50  0001 C CNN
F 3 "" H 9950 4650 50  0000 C CNN
	1    9950 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5B54339D
P 9150 4400
F 0 "R11" V 9230 4400 50  0000 C CNN
F 1 "1k" V 9150 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9080 4400 50  0001 C CNN
F 3 "" H 9150 4400 50  0000 C CNN
	1    9150 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 4400 9000 4400
Wire Wire Line
	9300 4400 9400 4400
$Comp
L power:GND #PWR033
U 1 1 5B5433A5
P 9950 5300
F 0 "#PWR033" H 9950 5050 50  0001 C CNN
F 1 "GND" H 9950 5150 50  0000 C CNN
F 2 "" H 9950 5300 50  0000 C CNN
F 3 "" H 9950 5300 50  0000 C CNN
	1    9950 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5B5433AB
P 9950 5050
F 0 "R13" H 10050 5150 50  0000 C CNN
F 1 "100k" V 9950 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9880 5050 50  0001 C CNN
F 3 "" H 9950 5050 50  0000 C CNN
	1    9950 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5B5433B1
P 9700 5300
F 0 "#PWR032" H 9700 5050 50  0001 C CNN
F 1 "GND" H 9700 5150 50  0000 C CNN
F 2 "" H 9700 5300 50  0000 C CNN
F 3 "" H 9700 5300 50  0000 C CNN
	1    9700 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 4400 9700 4400
Wire Wire Line
	9700 4400 9950 4400
Wire Wire Line
	9700 4400 9700 4700
Wire Wire Line
	9700 4900 9700 5300
Wire Wire Line
	9950 5300 9950 5200
Wire Wire Line
	9950 4800 9950 4850
Wire Wire Line
	9950 4850 9950 4900
Wire Wire Line
	9950 4850 10350 4850
Connection ~ 9950 4850
Wire Wire Line
	9950 4400 9950 4500
Connection ~ 9700 4400
NoConn ~ 10350 6350
NoConn ~ 10550 6350
Text Notes 1350 6250 0    60   ~ 0
maybe use 82k instead of 100k to \nnot get more than 3V high
Text HLabel 5700 1450 2    60   Output ~ 0
switch
Text Label 8700 4400 0    60   ~ 0
LEDr_i
Text Label 5250 4400 0    60   ~ 0
LEDg_i
Text Label 1650 4400 0    60   ~ 0
LEDb_i
Text HLabel 5700 2550 2    60   Input ~ 0
ms
Wire Notes Line
	600  3700 11100 3700
Text Notes 600  650  0    79   ~ 0
Attiny44A
Text Notes 600  3900 0    79   ~ 0
LED input with PWM smoothing
Wire Wire Line
	6500 5300 6500 5200
Wire Wire Line
	6500 4800 6500 4850
Wire Wire Line
	6500 4850 6500 4900
Wire Wire Line
	6500 4850 6900 4850
Connection ~ 6500 4850
$Comp
L MCU_Microchip_ATtiny:ATtiny44A-SSU U7
U 1 1 5B6669D0
P 4450 2050
F 0 "U7" H 4000 2900 50  0000 C CNN
F 1 "ATTINY44A-SSU" H 4800 1200 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 4450 1850 50  0001 C CIN
F 3 "" H 4450 2050 50  0001 C CNN
	1    4450 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint W12
U 1 1 5B667B5A
P 3500 1000
F 0 "W12" H 3500 1200 50  0000 C CNN
F 1 "program+" H 3500 1300 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3700 1000 50  0001 C CNN
F 3 "" H 3700 1000 50  0000 C CNN
	1    3500 1000
	-1   0    0    -1  
$EndComp
$Comp
L Connector:TestPoint W17
U 1 1 5B66807A
P 7050 2050
F 0 "W17" V 7050 2300 50  0000 C CNN
F 1 "TEST_1P" V 7050 2550 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 7250 2050 50  0001 C CNN
F 3 "" H 7250 2050 50  0000 C CNN
	1    7050 2050
	0    1    -1   0   
$EndComp
$Comp
L Connector:TestPoint W15
U 1 1 5B6680DB
P 5200 2650
F 0 "W15" V 5200 2900 50  0000 C CNN
F 1 "TEST_1P" V 5200 3150 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5400 2650 50  0001 C CNN
F 3 "" H 5400 2650 50  0000 C CNN
	1    5200 2650
	0    1    -1   0   
$EndComp
$Comp
L Connector:TestPoint W14
U 1 1 5B668143
P 7050 1950
F 0 "W14" V 7050 2200 50  0000 C CNN
F 1 "TEST_1P" V 7050 2450 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 7250 1950 50  0001 C CNN
F 3 "" H 7250 1950 50  0000 C CNN
	1    7050 1950
	0    1    -1   0   
$EndComp
$Comp
L Connector:TestPoint W13
U 1 1 5B6681AA
P 7050 1850
F 0 "W13" V 7050 2100 50  0000 C CNN
F 1 "TEST_1P" V 7050 2350 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 7250 1850 50  0001 C CNN
F 3 "" H 7250 1850 50  0000 C CNN
	1    7050 1850
	0    1    -1   0   
$EndComp
$Comp
L Connector:TestPoint W11
U 1 1 5B667CEE
P 3700 3100
F 0 "W11" H 3700 3300 50  0000 C CNN
F 1 "program-" H 3700 3400 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3900 3100 50  0001 C CNN
F 3 "" H 3900 3100 50  0000 C CNN
	1    3700 3100
	1    0    0    1   
$EndComp
Wire Wire Line
	7050 2050 6900 2050
Wire Wire Line
	3500 3000 3700 3000
Wire Wire Line
	3700 3000 3700 3100
Connection ~ 3700 3000
Text Notes 9600 2400 2    60   ~ 0
set mode=manuel\nwhen reprogramming!
Wire Wire Line
	4450 3000 4450 2950
Wire Wire Line
	3700 3000 4450 3000
Text HLabel 5700 2450 2    60   Output ~ 0
motor_auto
Text HLabel 5700 2350 2    60   Output ~ 0
motor_manual
Wire Wire Line
	5050 2350 5700 2350
Wire Wire Line
	5050 2450 5700 2450
Wire Wire Line
	3200 1000 3200 1100
Wire Wire Line
	3500 1100 3500 1800
Wire Wire Line
	4450 1100 4450 1150
Wire Wire Line
	6900 2050 6900 2300
Wire Wire Line
	6550 2650 6550 2600
Wire Wire Line
	6550 2950 6550 3100
Connection ~ 6900 2050
Wire Wire Line
	5050 2050 6900 2050
$Comp
L power:+BATT #PWR?
U 1 1 5B8DD07B
P 1750 2300
AR Path="/5B8DD07B" Ref="#PWR?"  Part="1" 
AR Path="/5B501B74/5B8DD07B" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 1750 2150 50  0001 C CNN
F 1 "+BATT" H 1750 2440 50  0000 C CNN
F 2 "" H 1750 2300 50  0000 C CNN
F 3 "" H 1750 2300 50  0000 C CNN
	1    1750 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2550 5700 2550
$Comp
L Device:R R2
U 1 1 5B8E60DB
P 1750 2500
F 0 "R2" V 1830 2500 50  0000 C CNN
F 1 "470k" V 1750 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1680 2500 50  0001 C CNN
F 3 "" H 1750 2500 50  0000 C CNN
	1    1750 2500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 5B8E6163
P 1750 2900
F 0 "R3" V 1830 2900 50  0000 C CNN
F 1 "1Meg" V 1750 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1680 2900 50  0001 C CNN
F 3 "" H 1750 2900 50  0000 C CNN
	1    1750 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5050 2150 5600 2150
Text Label 5600 2150 2    60   ~ 0
battvolt
$Comp
L power:GND #PWR024
U 1 1 5B8E83CE
P 1750 3100
F 0 "#PWR024" H 1750 2850 50  0001 C CNN
F 1 "GND" H 1750 2950 50  0000 C CNN
F 2 "" H 1750 3100 50  0000 C CNN
F 3 "" H 1750 3100 50  0000 C CNN
	1    1750 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2300 1750 2350
Wire Wire Line
	1750 2650 1750 2700
Wire Wire Line
	1750 3050 1750 3100
Wire Wire Line
	1750 2700 2250 2700
Connection ~ 1750 2700
Wire Wire Line
	1750 2700 1750 2750
Text Label 2250 2700 2    60   ~ 0
battvolt
Wire Wire Line
	5050 2650 5200 2650
$Comp
L power:GND #PWR034
U 1 1 5BC066A2
P 6900 3100
F 0 "#PWR034" H 6900 2850 50  0001 C CNN
F 1 "GND" H 6900 2950 50  0000 C CNN
F 2 "" H 6900 3100 50  0000 C CNN
F 3 "" H 6900 3100 50  0000 C CNN
	1    6900 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5BC066A8
P 6900 2450
F 0 "R14" V 6980 2450 50  0000 C CNN
F 1 "220" V 6900 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6830 2450 50  0001 C CNN
F 3 "" H 6900 2450 50  0000 C CNN
	1    6900 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_ALT D5
U 1 1 5BC066AE
P 6900 2800
F 0 "D5" V 6900 2950 50  0000 C CNN
F 1 "LED_ora" V 6700 2500 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 6900 2800 50  0001 C CNN
F 3 "" H 6900 2800 50  0001 C CNN
	1    6900 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6900 2650 6900 2600
Wire Wire Line
	6900 2950 6900 3100
Wire Wire Line
	5050 1850 7050 1850
Wire Wire Line
	5050 1950 6550 1950
Wire Wire Line
	6550 1950 6550 2300
Connection ~ 6550 1950
Wire Wire Line
	6550 1950 7050 1950
Wire Wire Line
	3500 1100 4450 1100
Connection ~ 3500 1100
Wire Wire Line
	3500 1000 3500 1100
Wire Wire Line
	3200 1100 3500 1100
$EndSCHEMATC

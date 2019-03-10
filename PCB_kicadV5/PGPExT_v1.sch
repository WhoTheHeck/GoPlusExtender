EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
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
L Regulator_Linear:TPS76930 U6
U 1 1 58012E6A
P 8150 2000
F 0 "U6" H 7900 2250 50  0000 C CNN
F 1 "TPS76930" H 8300 2250 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 8400 1800 50  0001 C CIN
F 3 "http://www.produktinfo.conrad.com/datenblaetter/1200000-1299999/001261319-da-01-en-IC_REG_LDO_3V_TPS76930DBVT_SOT_23_5_TID.pdf" H 8150 2000 50  0001 C CNN
	1    8150 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 58013240
P 4450 3050
F 0 "#PWR010" H 4450 2800 50  0001 C CNN
F 1 "GND" H 4450 2900 50  0000 C CNN
F 2 "" H 4450 3050 50  0000 C CNN
F 3 "" H 4450 3050 50  0000 C CNN
	1    4450 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5801325A
P 8150 3050
F 0 "#PWR018" H 8150 2800 50  0001 C CNN
F 1 "GND" H 8150 2900 50  0000 C CNN
F 2 "" H 8150 3050 50  0000 C CNN
F 3 "" H 8150 3050 50  0000 C CNN
	1    8150 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR08
U 1 1 5801328E
P 3850 1800
F 0 "#PWR08" H 3850 1650 50  0001 C CNN
F 1 "+BATT" H 3850 1940 50  0000 C CNN
F 2 "" H 3850 1800 50  0000 C CNN
F 3 "" H 3850 1800 50  0000 C CNN
	1    3850 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 58015B56
P 8850 3050
F 0 "#PWR020" H 8850 2800 50  0001 C CNN
F 1 "GND" H 8850 2900 50  0000 C CNN
F 2 "" H 8850 3050 50  0000 C CNN
F 3 "" H 8850 3050 50  0000 C CNN
	1    8850 3050
	1    0    0    -1  
$EndComp
Text Notes 2800 2350 0    60   ~ 0
+ 5kR 0603 for \ncharge controller
$Comp
L Connector:TestPoint W9
U 1 1 58013EC7
P 10650 4000
F 0 "W9" H 10650 4270 50  0000 C CNN
F 1 "motor+" H 10650 4200 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10850 4000 50  0001 C CNN
F 3 "" H 10850 4000 50  0000 C CNN
	1    10650 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint W8
U 1 1 58013F5A
P 10400 5850
F 0 "W8" H 10400 6120 50  0000 C CNN
F 1 "motor-" H 10400 6050 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10600 5850 50  0001 C CNN
F 3 "" H 10600 5850 50  0000 C CNN
	1    10400 5850
	-1   0    0    1   
$EndComp
Text Notes 2900 1900 0    60   ~ 0
charge\ncontroller
Text Notes 7100 6200 0    60   ~ 0
connect right pads to vib-motor\nconnect left pads to GoPlus
$Comp
L Connector:TestPoint W5
U 1 1 580E82CA
P 3750 4600
F 0 "W5" H 3750 4870 50  0000 C CNN
F 1 "switch" H 3750 4800 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3950 4600 50  0001 C CNN
F 3 "" H 3950 4600 50  0000 C CNN
	1    3750 4600
	-1   0    0    -1  
$EndComp
Text Notes 3400 4200 0    60   ~ 0
connect to switch \nplus (top) of GoPlus
Text Label 4350 5100 2    60   ~ 0
switch
$Comp
L power:GND #PWR07
U 1 1 58F646A1
P 3200 5600
F 0 "#PWR07" H 3200 5350 50  0001 C CNN
F 1 "GND" H 3200 5450 50  0000 C CNN
F 2 "" H 3200 5600 50  0000 C CNN
F 3 "" H 3200 5600 50  0000 C CNN
	1    3200 5600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:TestPoint W1
U 1 1 5A5B11EB
P 1500 4050
F 0 "W1" V 1500 4320 50  0000 C CNN
F 1 "GoPlusPower+" V 1600 4300 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 1700 4050 50  0001 C CNN
F 3 "" H 1700 4050 50  0000 C CNN
	1    1500 4050
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint W2
U 1 1 5A5B129F
P 1500 4400
F 0 "W2" V 1500 4670 50  0000 C CNN
F 1 "GoPlusPower-" V 1600 4650 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 1700 4400 50  0001 C CNN
F 3 "" H 1700 4400 50  0000 C CNN
	1    1500 4400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5A5B1360
P 1050 4500
F 0 "#PWR02" H 1050 4250 50  0001 C CNN
F 1 "GND" H 1050 4350 50  0000 C CNN
F 2 "" H 1050 4500 50  0000 C CNN
F 3 "" H 1050 4500 50  0000 C CNN
	1    1050 4500
	1    0    0    -1  
$EndComp
Text Notes 600  3600 0    79   ~ 0
Connection for GoPlus
$Comp
L power:VDD #PWR019
U 1 1 5A5B24AC
P 8850 1850
F 0 "#PWR019" H 8850 1700 50  0001 C CNN
F 1 "VDD" H 8850 1990 50  0000 C CNN
F 2 "" H 8850 1850 50  0001 C CNN
F 3 "" H 8850 1850 50  0001 C CNN
	1    8850 1850
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR01
U 1 1 5A5B24FA
P 1050 3950
F 0 "#PWR01" H 1050 3800 50  0001 C CNN
F 1 "VDD" H 1050 4090 50  0000 C CNN
F 2 "" H 1050 3950 50  0001 C CNN
F 3 "" H 1050 3950 50  0001 C CNN
	1    1050 3950
	1    0    0    -1  
$EndComp
Text Notes 4850 3600 0    79   ~ 0
Automation mode selector
Text Notes 6850 3650 0    79   ~ 0
Vibration motor control
Text Notes 2600 3600 0    79   ~ 0
Button pressing switch
Text Notes 600  1300 0    79   ~ 0
Power management
$Comp
L power:GND #PWR012
U 1 1 5B290FEF
P 6050 5700
F 0 "#PWR012" H 6050 5450 50  0001 C CNN
F 1 "GND" H 6050 5550 50  0000 C CNN
F 2 "" H 6050 5700 50  0000 C CNN
F 3 "" H 6050 5700 50  0000 C CNN
	1    6050 5700
	1    0    0    -1  
$EndComp
Text Label 4750 4800 0    60   ~ 0
mode_select
$Comp
L Switch:SW_SPDT SW1
U 1 1 5B2B1500
P 5700 4800
F 0 "SW1" H 5700 4970 50  0000 C CNN
F 1 "SW_SPDT" H 5700 4600 50  0000 C CNN
F 2 "additional_parts:SW_SSSS912500_ALPS" H 5700 4800 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/15/SSSS9-1370708.pdf" H 5700 4800 50  0001 C CNN
	1    5700 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1850 8850 1900
Wire Wire Line
	8850 1900 8850 2250
Connection ~ 8850 1900
Wire Notes Line
	2800 1700 2800 2150
Wire Notes Line
	2800 2150 3500 2150
Wire Notes Line
	3500 2150 3500 1700
Wire Notes Line
	3500 1700 2800 1700
Wire Notes Line
	3500 1900 3850 1900
Wire Wire Line
	3750 4600 3750 5000
Wire Wire Line
	1500 4400 1050 4400
Wire Wire Line
	1050 4400 1050 4500
Wire Wire Line
	1050 3950 1050 4050
Wire Wire Line
	1050 4050 1500 4050
Wire Wire Line
	6050 4900 6050 5700
Wire Wire Line
	4750 4800 5500 4800
Wire Wire Line
	3750 5000 3600 5000
$Comp
L Device:CP1 C3
U 1 1 5B2E43AD
P 8850 2400
F 0 "C3" H 8875 2500 50  0000 L CNN
F 1 "4.7u" H 8875 2300 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 8850 2400 50  0001 C CNN
F 3 "" H 8850 2400 50  0001 C CNN
	1    8850 2400
	1    0    0    -1  
$EndComp
Text Notes 8750 1650 0    60   ~ 0
3.0V!
$Sheet
S 1700 6700 3450 600 
U 5B501B74
F0 "PGPExt_Signal_Processing" 60
F1 "PGPExt_Signal_Processing.sch" 60
F2 "switch" O R 5150 7000 60 
F3 "ms" I R 5150 6850 60 
F4 "motor_auto" O R 5150 7100 50 
F5 "motor_manual" O R 5150 7200 50 
$EndSheet
Text Notes 650  800  0    118  ~ 0
Pokemon Go Plus Extender v1.0
Wire Notes Line
	600  1100 11100 1100
Wire Notes Line
	600  3400 11100 3400
Wire Notes Line
	600  6300 11100 6300
Wire Notes Line
	4700 3500 4700 6200
Wire Notes Line
	6600 3500 6600 6200
$Comp
L additional_parts:TC1271A U2
U 1 1 5B5884A3
P 4450 2250
F 0 "U2" H 4250 2400 60  0000 C CNN
F 1 "TC1271A" H 4700 1750 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4450 2250 60  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22035D.pdf" H 4450 2250 60  0001 C CNN
	1    4450 2250
	1    0    0    -1  
$EndComp
$Comp
L additional_parts:TPS22918 U4
U 1 1 5B590C61
P 6900 2050
F 0 "U4" H 6625 2300 60  0000 C CNN
F 1 "TPS22918" H 7000 1725 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 6950 2075 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps22918.pdf" H 6950 2075 60  0001 C CNN
	1    6900 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5B591909
P 6100 3050
F 0 "#PWR013" H 6100 2800 50  0001 C CNN
F 1 "GND" H 6100 2900 50  0000 C CNN
F 2 "" H 6100 3050 50  0000 C CNN
F 3 "" H 6100 3050 50  0000 C CNN
	1    6100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2050 6100 3050
Wire Wire Line
	3850 1800 3850 1900
Text Notes 4150 2000 0    60   ~ 0
3,08V shutoff
Wire Wire Line
	4000 2350 3950 2350
Wire Wire Line
	3950 2350 3950 2700
$Comp
L power:VDDA #PWR015
U 1 1 5B5A2F90
P 7600 1850
F 0 "#PWR015" H 7600 1700 50  0001 C CNN
F 1 "VDDA" H 7600 2000 50  0000 C CNN
F 2 "" H 7600 1850 50  0001 C CNN
F 3 "" H 7600 1850 50  0001 C CNN
	1    7600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2550 8850 3050
Text Label 5800 7000 2    60   ~ 0
switch
Wire Wire Line
	5150 7000 5800 7000
Wire Wire Line
	5150 6850 5800 6850
Text Label 5800 6850 2    60   ~ 0
mode_select
Wire Wire Line
	6050 4900 5900 4900
NoConn ~ 5900 4700
Text Notes 6100 4900 0    47   ~ 0
manuel\n\nauto
$Comp
L Analog_Switch:TS5A3166DBVR U1
U 1 1 5B649C09
P 3300 5000
F 0 "U1" H 3200 5325 50  0000 R CNN
F 1 "TS5A3166" H 3200 5250 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3350 4750 50  0001 L CNN
F 3 "http://www.produktinfo.conrad.com/datenblaetter/1100000-1199999/001187256-da-01-en-IC_SWITCH_SPST_TS5A3166DBVR_SOT_23_5_TID.pdf" H 3400 5000 50  0001 C CNN
	1    3300 5000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 5600 3200 5300
$Comp
L power:GND #PWR05
U 1 1 5B649E61
P 2850 5600
F 0 "#PWR05" H 2850 5350 50  0001 C CNN
F 1 "GND" H 2850 5450 50  0000 C CNN
F 2 "" H 2850 5600 50  0000 C CNN
F 3 "" H 2850 5600 50  0000 C CNN
	1    2850 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5600 2850 5000
Wire Wire Line
	2850 5000 3000 5000
$Comp
L power:VDD #PWR06
U 1 1 5B649F9D
P 3200 4450
F 0 "#PWR06" H 3200 4300 50  0001 C CNN
F 1 "VDD" H 3200 4590 50  0000 C CNN
F 2 "" H 3200 4450 50  0001 C CNN
F 3 "" H 3200 4450 50  0001 C CNN
	1    3200 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 4450 3200 4700
NoConn ~ 7450 2050
NoConn ~ 7450 2200
Wire Wire Line
	7450 1900 7600 1900
Wire Wire Line
	6350 2050 6100 2050
Wire Wire Line
	4000 2200 3950 2200
Wire Wire Line
	3950 2200 3950 1900
Connection ~ 3950 1900
NoConn ~ 4900 2350
$Comp
L power:GND #PWR011
U 1 1 5B65ABDE
P 5600 3050
F 0 "#PWR011" H 5600 2800 50  0001 C CNN
F 1 "GND" H 5600 2900 50  0000 C CNN
F 2 "" H 5600 3050 50  0000 C CNN
F 3 "" H 5600 3050 50  0000 C CNN
	1    5600 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2600 5600 3050
Wire Wire Line
	5050 2200 5050 2650
Wire Wire Line
	4900 2200 5050 2200
Wire Wire Line
	5050 2200 5200 2200
Connection ~ 5050 2200
$Comp
L additional_parts:SN74AUC1GU U3
U 1 1 5B65C407
P 5600 2300
F 0 "U3" H 5500 2625 50  0000 R CNN
F 1 "SN74AUC1GU" H 5500 2550 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5650 2050 50  0001 L CNN
F 3 "" H 5700 2300 50  0001 C CNN
	1    5600 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 2650 5050 2650
NoConn ~ 5200 2400
Wire Wire Line
	7600 1850 7600 1900
Connection ~ 7600 1900
$Comp
L Device:R R1
U 1 1 5B65EB06
P 3800 5100
F 0 "R1" V 3880 5100 50  0000 C CNN
F 1 "2k7" V 3800 5100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3730 5100 50  0001 C CNN
F 3 "" H 3800 5100 50  0000 C CNN
	1    3800 5100
	0    -1   1    0   
$EndComp
Wire Wire Line
	4350 5100 3950 5100
Wire Wire Line
	3650 5100 3600 5100
$Comp
L Device:C C1
U 1 1 5B6615E2
P 6300 2450
F 0 "C1" H 6325 2550 50  0000 L CNN
F 1 "22n" H 6325 2350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6338 2300 50  0001 C CNN
F 3 "" H 6300 2450 50  0000 C CNN
	1    6300 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5B66165D
P 6300 3050
F 0 "#PWR014" H 6300 2800 50  0001 C CNN
F 1 "GND" H 6300 2900 50  0000 C CNN
F 2 "" H 6300 3050 50  0000 C CNN
F 3 "" H 6300 3050 50  0000 C CNN
	1    6300 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2200 6300 2200
Wire Wire Line
	6300 2200 6350 2200
Wire Wire Line
	6300 2200 6300 2300
Connection ~ 6300 2200
Wire Wire Line
	6300 2600 6300 3050
Wire Wire Line
	4450 2850 4450 3050
Wire Wire Line
	5600 1900 5600 2000
Connection ~ 5600 1900
Wire Wire Line
	3850 1900 3950 1900
Wire Wire Line
	3950 1900 5600 1900
Wire Wire Line
	5600 1900 6350 1900
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 5B668DBC
P 3950 2800
F 0 "JP1" V 3950 2900 50  0000 C CNN
F 1 "Jumper_NO_Small" V 3950 2400 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3950 2800 50  0001 C CNN
F 3 "" H 3950 2800 50  0001 C CNN
	1    3950 2800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5B668EC3
P 3950 3050
F 0 "#PWR09" H 3950 2800 50  0001 C CNN
F 1 "GND" H 3950 2900 50  0000 C CNN
F 2 "" H 3950 3050 50  0000 C CNN
F 3 "" H 3950 3050 50  0000 C CNN
	1    3950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2900 3950 3050
Wire Wire Line
	8550 1900 8850 1900
Wire Wire Line
	7600 1900 7750 1900
Wire Wire Line
	7750 2000 7600 2000
Wire Wire Line
	7600 2000 7600 2650
Wire Wire Line
	8150 2300 8150 3050
$Comp
L power:VDD #PWR016
U 1 1 5B6EAF9B
P 7800 4100
F 0 "#PWR016" H 7800 3950 50  0001 C CNN
F 1 "VDD" H 7800 4240 50  0000 C CNN
F 2 "" H 7800 4100 50  0001 C CNN
F 3 "" H 7800 4100 50  0001 C CNN
	1    7800 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5B6EB00E
P 7800 5300
F 0 "#PWR017" H 7800 5050 50  0001 C CNN
F 1 "GND" H 7800 5150 50  0000 C CNN
F 2 "" H 7800 5300 50  0000 C CNN
F 3 "" H 7800 5300 50  0000 C CNN
	1    7800 5300
	1    0    0    -1  
$EndComp
Text Label 5800 7100 2    60   ~ 0
motor_auto
Text Label 5800 7200 2    60   ~ 0
motor_manual
Wire Wire Line
	5800 7100 5150 7100
Wire Wire Line
	5150 7200 5800 7200
$Comp
L Device:C C2
U 1 1 5B6F58F6
P 7400 4650
F 0 "C2" H 7425 4750 50  0000 L CNN
F 1 "100n" H 7425 4550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7438 4500 50  0001 C CNN
F 3 "" H 7400 4650 50  0000 C CNN
	1    7400 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 4100 7800 4150
Wire Wire Line
	7400 4500 7400 4150
Wire Wire Line
	7400 4150 7800 4150
Connection ~ 7800 4150
Wire Wire Line
	7800 4150 7800 4200
Wire Wire Line
	7400 4800 7400 5250
Wire Wire Line
	7400 5250 7800 5250
Wire Wire Line
	7800 5250 7800 5200
Wire Wire Line
	7800 5250 7800 5300
Connection ~ 7800 5250
Wire Wire Line
	10150 4000 10650 4000
Wire Wire Line
	10150 5450 10650 5450
Wire Wire Line
	10650 5450 10650 4000
Connection ~ 10650 4000
Wire Wire Line
	10150 4400 10400 4400
Wire Wire Line
	10400 4400 10400 5850
Wire Wire Line
	10150 5850 10400 5850
Connection ~ 10400 5850
NoConn ~ 10150 5650
NoConn ~ 10150 5250
NoConn ~ 10150 4600
NoConn ~ 10150 4200
Wire Wire Line
	9850 4800 9850 4850
Wire Wire Line
	9850 4850 9150 4850
Wire Wire Line
	9850 6050 9850 6150
Wire Wire Line
	9850 6150 9150 6150
Text Label 9150 6150 0    60   ~ 0
motor_auto
Text Label 9150 4850 0    60   ~ 0
motor_manual
$Comp
L power:VDD #PWR021
U 1 1 5B73E864
P 9450 5250
F 0 "#PWR021" H 9450 5100 50  0001 C CNN
F 1 "VDD" H 9450 5390 50  0000 C CNN
F 2 "" H 9450 5250 50  0001 C CNN
F 3 "" H 9450 5250 50  0001 C CNN
	1    9450 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5B73ECA7
P 9450 5850
F 0 "#PWR022" H 9450 5600 50  0001 C CNN
F 1 "GND" H 9450 5700 50  0000 C CNN
F 2 "" H 9450 5850 50  0000 C CNN
F 3 "" H 9450 5850 50  0000 C CNN
	1    9450 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 5750 9450 5750
Wire Wire Line
	9450 5750 9450 5850
Wire Wire Line
	9450 5250 9450 5350
Wire Wire Line
	9450 5350 9550 5350
$Comp
L Connector:TestPoint W6
U 1 1 5B74442B
P 9000 4000
F 0 "W6" H 9000 4270 50  0000 C CNN
F 1 "GoPlus-" H 9000 4200 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9200 4000 50  0001 C CNN
F 3 "" H 9200 4000 50  0000 C CNN
	1    9000 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint W7
U 1 1 5B7444A5
P 9350 4000
F 0 "W7" H 9350 4270 50  0000 C CNN
F 1 "GoPlus+" H 9350 4200 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9550 4000 50  0001 C CNN
F 3 "" H 9550 4000 50  0000 C CNN
	1    9350 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4000 9000 4500
Wire Wire Line
	9000 4500 9550 4500
Wire Wire Line
	9350 4000 9350 4100
Wire Wire Line
	9350 4100 9550 4100
$Comp
L additional_parts:ADG888YRUZ U5
U 1 1 5B7063CE
P 9850 4000
F 0 "U5" H 9850 4265 50  0000 C CNN
F 1 "ADG888YRUZ" H 9850 4174 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 10100 3250 50  0001 C CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/ADG888.pdf" H 8800 3550 50  0001 C CNN
	1    9850 4000
	1    0    0    -1  
$EndComp
$Comp
L additional_parts:ADG888YRUZ U5
U 2 1 5B706606
P 9850 5250
F 0 "U5" H 9850 5515 50  0000 C CNN
F 1 "ADG888YRUZ" H 9850 5424 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 10100 4500 50  0001 C CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/ADG888.pdf" H 8800 4800 50  0001 C CNN
	2    9850 5250
	1    0    0    -1  
$EndComp
$Comp
L additional_parts:ADG888YRUZ U5
U 3 1 5B706737
P 7800 4700
F 0 "U5" H 7980 4746 50  0000 L CNN
F 1 "ADG888YRUZ" H 7980 4655 50  0000 L CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 8050 3950 50  0001 C CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/ADG888.pdf" H 6750 4250 50  0001 C CNN
	3    7800 4700
	1    0    0    -1  
$EndComp
Wire Notes Line style solid
	8500 5900 8650 5600
Wire Notes Line style solid
	8650 5600 8550 5650
Wire Notes Line style solid
	8650 5700 8650 5600
$Comp
L Device:D_ALT D1
U 1 1 5B710E42
P 10650 5650
F 0 "D1" V 10604 5729 50  0000 L CNN
F 1 "D_ALT" V 10695 5729 50  0000 L CNN
F 2 "Diode_SMD:D_SOT-23_ANK" H 10650 5650 50  0001 C CNN
F 3 "~" H 10650 5650 50  0001 C CNN
	1    10650 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	10400 5850 10650 5850
Wire Wire Line
	10650 5850 10650 5800
Wire Wire Line
	10650 5500 10650 5450
Connection ~ 10650 5450
$Comp
L Connector:TestPoint W3
U 1 1 5B79D5D6
P 1500 5500
F 0 "W3" V 1500 5770 50  0000 C CNN
F 1 "BatteryPower+" V 1600 5750 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 1700 5500 50  0001 C CNN
F 3 "" H 1700 5500 50  0000 C CNN
	1    1500 5500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint W4
U 1 1 5B79D5DC
P 1500 5850
F 0 "W4" V 1500 6120 50  0000 C CNN
F 1 "BatteryPower-" V 1600 6100 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 1700 5850 50  0001 C CNN
F 3 "" H 1700 5850 50  0000 C CNN
	1    1500 5850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5B79D5E2
P 1050 5950
F 0 "#PWR04" H 1050 5700 50  0001 C CNN
F 1 "GND" H 1050 5800 50  0000 C CNN
F 2 "" H 1050 5950 50  0000 C CNN
F 3 "" H 1050 5950 50  0000 C CNN
	1    1050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5850 1050 5850
Wire Wire Line
	1050 5850 1050 5950
Wire Wire Line
	1050 5400 1050 5500
Wire Wire Line
	1050 5500 1500 5500
$Comp
L power:+BATT #PWR03
U 1 1 5B7A0E18
P 1050 5400
F 0 "#PWR03" H 1050 5250 50  0001 C CNN
F 1 "+BATT" H 1050 5540 50  0000 C CNN
F 2 "" H 1050 5400 50  0000 C CNN
F 3 "" H 1050 5400 50  0000 C CNN
	1    1050 5400
	1    0    0    -1  
$EndComp
Text Notes 600  5150 0    79   ~ 0
Connection for battery
Wire Notes Line
	600  4850 2250 4850
Wire Notes Line
	2350 3500 2350 6200
$EndSCHEMATC

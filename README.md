# Voice Control Servo Motor 

## Intro
Contol of the angle (0 to 180 degrees due to limitation of the motor) and speed of the servo motor using DE10-Nano FPGA by terasic. It uses an Altera Cyclone V which is programmed using quatrus prime 16.1. An android application is used to send the voice commands from the phone to FPGA. It communicates through bluetooth via UART protocol using a RFS daughter card by terasic

## Verilog

It consist of the following verilog codes used to program the FPGA 
1. servo_control (top level entry)
2. PWM_Generator (Generates the PWM signals to drive the motor)
3. UI (control the motor angle and speed)
4. UART folder

## Android App

The application captures words like angle, fast, slow, stop, forward, and back and send the data the user says. For the angle it capture specific angles ranging from 0 -180 and is send to the FPGA via bluetoth.
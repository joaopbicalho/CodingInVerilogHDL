# CodingInVerilogHDL

This repository contains projects written in Verilog (Hardware Design Language) from September 2021 to December 2021.

### ALU
This Arithmetic Logic Unit (ALU) takes in a 4-bit input and performs a variety of functions, including addition, sign extension, comparison, and multiplication. This ALU features a ripple-carry adder, and its output is stored in an 8-bit register. Additionally, the four least-significant bits of the register output are connected to the B input of the ALU. Code can also be downloaded into a DE1-SoC board with SW9 being used for the reset, SW[3:0] being used for the data input, KEY[3:1] for the function chosen, and the output is shown in the LEDs and in the HEX display

### SequenceDetectorFSM
Implementation of a FSM that recognizes two specific sequences of applied input symbols, namely four consecutive 1s or the sequence 1101. There is an input w and an output z.
Whenever w = 1 for four consecutive clock pulses, or when the sequence 1101 appears on w across four consecutive clock pulses, the value of z has to be 1; otherwise, z = 0. 

### MorseCode
Using the RateDivider, this circuit implements a Morse code encoder using a lookup table (LUT) to store codes and a shift register. It takes user input as an alphabetic letter from A to H and flashes it in Morse on the seven-segment display.

### PolynomialFSM
This Finite State Machine (FSM) implements ALUs, multiplexers, and registers in its datapath in order to load the polynomial expression AX^2 + BX + C into the final register.

### Counters
Features a Counter/Clock built using registers and the built in 50MHz clock available in the DE1-SOc board, and an 8-bit counter made with T flip-flops and containing a top-level module to make connections from the counter to the pushbuttons, switches and HEX displays of a DE1-SoC board.

### HEX Decoder
Design of a HEX decoder for the 7-segment HEX display present in the DE1-SoC board, the hex_decoder module can be instantiated any time in a verilog file to display a 4 bit number in the HEX display.

### 7400series Chips
Created modules that represent the 7432 (four 2-input OR gates), 7408 (four 2-input AND gates), and 7404 (six inverters). Used these modules to make a 2:1 multiplexer, and circuit can be downloaded into a DE1-SoC board using Switches 0 and 1 for the data inputs, Switch 9 for the select input, and the output is shown in LEDR0

### FullAdder
Design of a circuit that adds two four-bit numbers based on 4 instantiations of the full adder module, which takes two digits to be added and a potential carry digit and returns the sum and a carry digit. Circuit of the 4-bit ripple carry adder can be downloaded into a DE1-SoC board using switches SW7−4 and SW3−0 to represent the inputs
a and b, respectively, SW8 representing the carry-in, cin, of the adder and LEDR9 and LEDR3-0 representing the outputs
of the adder, cout and s respectively.

### Multiplexer_7:3
Implementation of a 7:3 multiplexer that can be downloaded into a DE1-SoC board with switches SW9−7  as the MuxSelect inputs, switches SW6−0 as the Input data inputs and LEDR0 as the output.



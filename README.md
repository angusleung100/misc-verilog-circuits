# Misc Logic Circuits
These are just components for it written in Verilog. Originally made for my 8-bit to 16-bit CPU scaling project. 

**Note:** As of Jan 2025, I have abandoned this project in pursuit of other projects. I have made the archive public, so feel free to look around. 

## Introduction
~~There a few 8-bit CPU examples on the internet and I wanted to set out and build my own but scaled up to 16-bits and add some more functionality.~~

~~Based on a computer architecture course I took during my undergrad, a CPU requires registers (to keep clock sync), an ALU, memory, control unit, counters, and more. I will attempt to create these components in Verilog and compile them together into a working CPU unit.~~

## Op Codes
~~These are operations that the CPU is able to support:~~

# Components
- 1/4/8 bit parallel load register (In-progress)
- 64kb RAM module

## Setting up environment
- [Icarus Verilog + GTKWave](https://bleyer.org/icarus/)

**Note:** Make sure to select the box to also install GTKWave alongside IVerilog.

## Compilation and State Verification
Compilation is done through IVerilog with GTKWave being the waveform visualizer. Each testbench (tb) file dumps a .vcd waveform file so results can be verified.

**Example Compilation and Test**
```
C:\iverilog\bin\iverilog.exe -o register1bit register1bit_tb.v register1bit.v
C:\iverilog\bin\vvp.exe register1bit

gtkwave register1bit_waveform.vcd
```

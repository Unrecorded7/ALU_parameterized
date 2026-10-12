# 2:1 Multiplexer — Verilog

## Overview
A 2:1 multiplexer (MUX) implemented in Verilog HDL. The project includes the RTL design and a testbench for functional simulation.

## Design
A 2:1 MUX selects one of two inputs based on the select signal.

- `a`, `b`: Data inputs
- `sel`: Select input
- `c`: Output

Boolean expression:

`c = (~sel & a) | (sel & b)`

## Tools Used
- Verilog HDL
- Icarus Verilog
- GTKWave

## Project Files
- `MUX.v` — MUX RTL design
- `testbench.v` — Testbench for simulation
- `wave.vcd` — Value Change Dump waveform file (optional)

## Run the Simulation

Compile the design and testbench:

```bash
iverilog -o output MUX.v testbench.v
```

Run the simulation:

```bash
vvp output
```

Open the waveform in GTKWave:

```bash
gtkwave wave.vcd
```

The testbench generates `wave.vcd` using `$dumpfile` and `$dumpvars`.

## Learning Objectives
- Verilog module instantiation
- Testbench development
- Functional simulation
- Waveform analysis using GTKWave
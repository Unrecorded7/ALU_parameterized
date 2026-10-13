# Parameterized 4-Bit ALU in Verilog

## Overview

This project implements a **parameterized Arithmetic Logic Unit (ALU)** using Verilog HDL. The ALU performs basic arithmetic and logical operations on two binary inputs. Its width can be configured through a parameter, making the design reusable for different bit widths.

## Features

- Parameterized data width using `WIDTH`
- Arithmetic addition and subtraction
- Bitwise AND and OR operations
- Combinational logic design
- Verilog testbench for functional verification
- Simulation using Icarus Verilog and waveform inspection with GTKWave

## Operations

| `sel`   | Operation   | Description |
|---------|-------------|-------------|
| `2'b00` | Addition    | `A + B`     |
| `2'b01` | Subtraction | `A - B`     |
| `2'b10` | Bitwise AND | `A & B`     |
| `2'b11` | Bitwise OR  | `A | B`     |

## Design Parameters

| Parameter | Default Value | Description |
|-----------|---------------|-------------|
| `WIDTH`   | `4`           | Number of bits in each input and the result |

The default configuration uses two 4-bit inputs (`A` and `B`), a 2-bit operation selector (`sel`), and a `WIDTH`-bit output (`Y`).

## Project Structure

```text
ALU_parameterized/
├── Alu.v
├── Alu_tb.v
└── README.md
```

## Tools Used

- **Verilog HDL** — RTL design
- **Icarus Verilog** — Compilation and simulation
- **GTKWave** — Waveform analysis

## Run the Simulation

Install Icarus Verilog and GTKWave, then open a terminal in the project directory.

### 1. Compile

```bash
iverilog -o output Alu.v Alu_tb.v
```

### 2. Run

```bash
vvp output
```

### 3. View Waveforms

```bash
gtkwave tb_.vcd
```

## Concepts Practiced

- Parameterized RTL design
- Combinational logic using `always @(*)`
- `case` statements for operation selection
- Arithmetic and bitwise operations
- Testbench development
- RTL simulation and waveform debugging

## Future Improvements

- Add XOR and NOT operations
- Add carry-out and zero flags
- Add signed arithmetic and overflow detection
- Expand the testbench with edge cases and automated checks

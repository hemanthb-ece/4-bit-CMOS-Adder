# Minor Project 1 – 4-bit Adder Using CMOS Logic

## Objective
Design and verify a 4-bit ripple-carry adder. The supplied project brief identifies Xschem, Ngspice, Magic, Netgen and the Sky130 open PDK for transistor-level schematic, simulation and layout work.

## Included in this repository
- `full_adder.v` – 1-bit full-adder RTL.
- `four_bit_adder.v` – four 1-bit adders connected as a ripple-carry adder.
- `tb_four_bit_adder.v` – self-checking testbench that creates `adder.vcd`.
- `Makefile` – compile, run and waveform targets.

## Run the digital functional simulation
Requirements: Icarus Verilog and GTKWave.

```bash
make
make wave
```

Or run manually:

```bash
iverilog -g2012 -o adder_sim full_adder.v four_bit_adder.v tb_four_bit_adder.v
vvp adder_sim
gtkwave adder.vcd
```

## Adder equations
`Sum = A ^ B ^ Cin`  
`Cout = (A & B) | (B & Cin) | (A & Cin)`

The four stages are connected so that each stage's carry-out drives the next stage's carry-in.

## Important scope note
This repository contains a digital RTL simulation and verification implementation. It does **not** claim that a transistor-level Sky130 layout, DRC-clean Magic layout, Ngspice transistor simulation or Netgen LVS verification has been completed. Those physical-design steps must be carried out separately in the named tools before claiming full CMOS layout completion.

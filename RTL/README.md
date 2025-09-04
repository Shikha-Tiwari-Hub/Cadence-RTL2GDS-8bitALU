# RTL Design – 8-bit ALU
This folder contains the RTL design and verification environment for an **8-bit ALU**.
# Project Setup Instructions
Follow the steps below to set up the project directory and required files.
## Step 1: Setup Project
```bash
# Make project directory
mkdir alu_rtl2gds
cd alu_rtl2gds

# Create sub-directories
mkdir rtl synth pd reports
```
## Step 2: Add RTL File
```bash
# Go inside rtl
cd rtl

# Create Verilog RTL and testbench
gedit alu8.v 
gedit alu8_tb.v 
```
*👉 Paste your Verilog code inside the files.*

# Simulation & Verification with Xcelium (xrun)
## compile & run
```bash
xrun -gui -access +rwc alu8.v alu8_tb.v
```
`-access +rwc` provides probing access to all the signals in the design hierarchy.\
`-gui` invokes the graphical mode of the NCSim tool in the following way:



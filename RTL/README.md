# RTL Design – 8-bit ALU
An **Arithmetic Logic Unit (ALU)** is the core combinational circuit of a processor, responsible for performing ***arithmetic operations** (addition, subtraction, increment, etc.) and **logic operations** (AND, OR, XOR, NOT, etc.).\
The ALU is first verified at the **RTL level** with testbenches, synthesized into **gate-level** netlist using **Cadence Genus**, and finally implemented in silicon layout with **Cadence Innovus**.
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
gedit alu.v 
gedit tb_alu.v 
```
*👉 Paste your Verilog code inside the files.*

## Step 3: Before invoking Cadence tools
Run the following commands
```bash
# Source Cadence environment (example)
csh
source /home/install/cshrc
```
# Simulation & Verification with Xcelium (xrun)
Cadence® Single-Core NCSim Simulator is the tool used for verification. Navigate to the simulation directory, where you have kept your RTL and testbench (simulation directory). We will discuss both the graphical as well as the batch mode of invoking the Incisive tool for simulation.\
You will see two files here: `alu.v`, which is the design itself, and `tb_alu.v`, which is the testbench, both written in Verilog.\
The process of simulation is, in fact, a three-step process:
1. `Compilation`, which is “checking the syntax and semantics of the code."
2. `Elaboration`, which is “creating the design hierarchy and connecting all the signals within the design.”
3. `Simulation`, which is “simulating the code using the snapshot created during the Elaboration phase.”
   
## Compile & Run
1. Execute the following command:
```bash
xrun -gui -access +rwc alu.v tb_alu.v
```
`-access +rwc` provides probing access to all the signals in the design hierarchy.\
`-gui` invokes the graphical mode of the NCSim tool in the following way:

img.

2. It opens the SimVision™ tool with the windows, as shown below.
   img

3. Click on the waveform icon on the Design Browser window after selecting the signals from the design hierarchy, and you can see the waveform as below with the simulation running, with selected signals in the window.
   img

<p align="center">
  🔹 End of Lab 🔹
</p>


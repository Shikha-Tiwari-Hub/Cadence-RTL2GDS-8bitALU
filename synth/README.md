# Synthesis (Cadence Genus)
Convert RTL into a gate-level netlist using Genus.

```bash
# Go to synthesis folder
cd ../synth

# Create tcl file
gedit alu8.tcl &
# Create constraints file
gedit alu8.sdc 
```
# Launch Genus for synthesis
```bash
genus -legacy_ui
```
**Inside the Genus console, run the synthesis script:**
* Reads your RTL (Verilog files)
* Applies constraints (from `.sdc`)
* Runs synthesis
* Generates schematic view of your design
```bash
source alu8.tcl
```
## After successful run, you can:*
* View the schematic:
  img.
* Generate synthesis **reports (timing, area, power)**.
* Export the **gate-level netlist**.
                                                                    ------  
                                                           🔚 End of Synthesis Lab  
  

# Physical Design – Cadence Innovus
**Physical Design (PD)** is the process of converting the synthesized **gate-level netlist** into an optimized **chip layout (GDSII)**.\
In this step, the design goes through:
* **Floorplanning** → Define chip/core area and place I/O pins
* **Power Planning** → Create power rings, straps, and rails to distribute VDD and VSS uniformly across the chip.
* **Placement** → Place standard cells on rows
* **Clock Tree Synthesis (CTS)** → Distribute clock with minimal skew
* **Routing** → Connect all signals with metal layers
* **Post-Route Optimization** → Timing, power, signal integrity fixes.
* **DRC Check** → Verify layout correctness\
The final output is a **GDSII file**, which is ready for fabrication.

# Launch Innovus for Physical Design
```bash
innovus
```
On the GUI screen do the followings:
1. File -> import Design\
   Netlist -> Verilog files -> alu_netlist.v\
   Power nets -> VDD\
   Ground Nets -> VSS\
   Analysis Configuration -> Create Analysis Configuration.. -> create -> Default.view\
   Save the Config.
   
## 1. Floorplanning
Floorplan -> Specify floor plan 

## 2. Power Planning
1. Power -> Power planning -> Add Ring

2. Power -> Power planning -> Add Stripe -> Add VDD VSS Vertical Power strips

3. Power -> Connect Global Nets (To connect internal Power Global Nets to the Output pins)

## 3. Special Routing
Happens before CTS so that buffers & cells have power.\
It connect std cell rails, pads, and macros to power/ground.

## 4. Placement
Place -> std cells (Placing standard cells to the design)

## 5. Clock Tree Synthesis (CTS)
1. Builds clock tree (balanced skew/latency).
   ```bash
   ccopt_design
   ```
2. Post-CTS optimization.
   ```bash
   optDesign -postCTS
   ```
3. STA ensures clocks meet timing.
   ```bash
   timeDesign -postCTS
   ```

## 6. Routing



























<p align="center">
  🔹 End of Lab 🔹
</p>

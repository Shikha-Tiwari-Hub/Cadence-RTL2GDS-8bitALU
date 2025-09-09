# Physical Design – Cadence Innovus
**Physical Design (PD)** is the process of converting the synthesized **gate-level netlist** into an optimized **chip layout (GDSII)**.\
In this step, the design goes through:
* **Floorplanning** → Define chip/core area and place I/O pins
* **Power Planning** → Create power rings, straps, and rails to distribute VDD and VSS uniformly across the chip.
* **Placement** → Place standard cells on rows
* **Clock Tree Synthesis (CTS)** → Distribute clock with minimal skew
* **Routing** → Connect all signals with metal layers
* **Post-Route Optimization** → Timing, power, signal integrity fixes.
* **Signoff** → Verify layout correctness\
The final output is a **GDSII file**, which is ready for fabrication.

# Launch Innovus for Physical Design
```bash
innovus
```
On the GUI screen do the followings:
`File → import Design\
Netlist → Verilog files → alu_netlist.v\
Power nets → VDD\
Ground Nets → VSS\
Analysis Configuration → Create Analysis Configuration.. → create → Default.view\`
*Save the Config.*
   
## 1. Floorplanning
On the GUI screen do the followings:
`Floorplan → Specify floor plan` \
<img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/b81ec1fc-9d61-4af9-b9e1-fcd219fc30ce" />

## 2. Power Planning
On the GUI screen do the followings:
1. `Power → Connect Global` Nets (To connect internal Power Global Nets to the Output pins)\

  
2. `Power → Power Planning → Add Ring → Basic (Tab)`
<img width="299" height="199" alt="image" src="https://github.com/user-attachments/assets/7be05d2b-19b4-4a55-9bd0-5c460dd2dc2c" />
<img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/408e221b-2924-489b-ba61-d2e3290d3387" />

3. `Power → Power planning → Add Stripe →  Basic (Tab)`
<img width="299" height="199" alt="image" src="https://github.com/user-attachments/assets/019ba6c0-054f-42ac-8e5e-8e511aeb8154" />
<img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/2b41324e-b06a-4338-b8dc-990675c2d67e" />

## 3. Special Routing
Happens before CTS so that buffers & cells have power. It connect std cell rails, pads, and macros to power/ground.\
On the GUI screen do the followings:
`Route → Special Route → Basic (Tab)` 
<img width="181" height="143" alt="image" src="https://github.com/user-attachments/assets/381796f6-7c8c-4298-903a-a01b64ddfdf3" />

## 4. Placement
Placement is the process of placing the standard cells and blocks in a floorplanned design.
1. Performs both global placement and pre-CTS optimization
   ```bash
   place_opt_design
   ```
2. Report any routing congestion hotspots
   ```bash
   reportCongestion -overflow
   ```
3. Perform a final check of the placement
   ```bash
   checkPlace
   ```
4. Save Design
   ```bash
   write_db placeOpt
   ```
   
## 5. Clock Tree Synthesis (CTS)
Clock Tree Synthesis is the process of inserting buffers in the clock path, with the goal of
minimizing clock skew and latency to optimize timing.
1. Builds clock tree (balanced skew/latency).
   ```bash
   create_clock_tree_spec -file alu.spec
   ```
   ```bash
   ccopt_design
   ```
3. Post-CTS optimization.
   ```bash
   optDesign -postCTS
   ```
4. Setup Time check
   ```bash
   timeDesign -postCTS
   ```
5. Hold Time check
   ```bash
   timeDesign -postCTS -hold
   ```
   
## 6. Routing
Detail routing is the process of connecting the cells and macros in the design on metal layers
specified in the technology LEF file that is generally provided by the foundry so that the
routes are DRC correct and timing and signal-integrity aware.

```bash
routeDesign -globalDetail
```
2. Perform post-route timing optimization 
```bash
optDesign -postRoute
```
3. Perform post-route timing optimization specifically for hold violations
```bash
optDesign -postRoute -hold
```
4. Perform post-route timing optimization specifically for setup violations
```bash
optDesign -postRoute -setup
```
5. Check DRC violations (Minimum width, minimum spacing, antenna violations)
   ```bash
   verify_drc
   ```
## 7. Timing and SI-Driven Routing
Set NanoRoute™ modes for timing and SI-driven routing guides the router to produce routes with the best Quality of Results (QoR).\
On the GUI screen do the followings:
`Route → NanoRoute → route`

## 8. Adding Filler Cells
Filler cells are used to fill the gaps between standard cell instances to provide continuity for the power and ground rails and n-wells.\
On the GUI screen do the followings:
`Place → Physical Cell → Add Filler`\
<img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/9a657306-1911-4843-b17f-84283d0a71af" />

## 9. Extracting RC Data
Extraction of Interconnect Data:
* SPEF (standard parasitic exchange format)
* Select a corner for extraction\
`Timing → Extract RC`
<img width="400" height="400" alt="image" src="https://github.com/user-attachments/assets/862fb4be-1616-4543-8451-f51ba7506f5c" />

## 10. Signoff and Verification
* Design-rule checks (DRCs) are checks that are performed with respect to the rules provided by a foundry for a particular technology and process node.
* Layout-vs.-schematic (LVS) violations occur when there is a mismatch in connectivity between what is in the placed and routed design and the Verilog netlist orshorted nets.
1. Check for DRC (Design Rule Check) violations
```bash
verify_drc
```
2. To make sure no net violates the antenna ratio rules
```bash
verify_antenna
```
3. Check for opens, shorts, and other connectivity issues
```bash
check_connectivity
```
4. Run a final, signoff-quality timing analysis
```bash
timeDesign -signoff
```



















<p align="center">
  🔹 End of Lab 🔹
</p>

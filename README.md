# 1. Single-Cycle RISC-V Processor

## Architecture

### Block Diagram

![Single Cycle Block Diagram](RISC-V_Single_Cycle/Block%20Diagram/RISC-V_Single_cycle_block_diagram.png)

### RTL Schematic (Vivado)

![Single Cycle RTL Schematic](RISC-V_Single_Cycle/RTL_Schematic/schematic.png)

---

## Instructions Used

```assembly
addi x1, x0, 10
addi x2, x0, 20
sw   x2, 80(x1)
lw   x4, 80(x1)

jal_label:
beq  x4, x2, label
addi x5, x4, 50

label:
addi x5, x4, 400
jal  x6, jal_label
```

---

## Output Waveforms

### Program Counter Testbench


![PC Testbench](RISC-V_Single_Cycle/Output%20Waveforms/pc.png)


### Adder Testbench


![Adder Testbench](RISC-V_Single_Cycle/Output%20Waveforms/adder.png)


### Multiplexer Testbench


![MUX Testbench](RISC-V_Single_Cycle/Output%20Waveforms/mux.png)


### Immediate Generator Testbench


![Immediate Generator](RISC-V_Single_Cycle/Output%20Waveforms/imm.png)


### Instruction Memory Testbench


![Instruction Memory](RISC-V_Single_Cycle/Output%20Waveforms/instr.png)


### ALU Testbench


![ALU Testbench](RISC-V_Single_Cycle/Output%20Waveforms/alu.png)


### Main Decoder Testbench


![Main Decoder](RISC-V_Single_Cycle/Output%20Waveforms/main_decoder.png)


### Data Memory Testbench


![Data Memory](RISC-V_Single_Cycle/Output%20Waveforms/data_mem.png)


### Register File Testbench


![Register File](RISC-V_Single_Cycle/Output%20Waveforms/regfile.png)


### Top-Level Waveform


![Top Module Waveform](RISC-V_Single_Cycle/Output%20Waveforms/Risc-V_Single_Cycle_Top_Waveform.png)


---

# 2. Multicycle RISC-V Processor

## Architecture

### Block Diagram


![Multicycle Block Diagram](RISC-V_Multicycle/Block%20and%20State%20Diagrams/RISC-V_Multicyle_Block_Diagram.png)


### State Diagram


![Multicycle State Diagram](RISC-V_Multicycle/Block%20and%20State%20Diagrams/RISC-V_Multicylce_State_Diagram.png)


### RTL Schematic (Vivado)


![Multicycle RTL Schematic](RISC-V_Multicycle/RTL_Schematic/schematic.png)


---

## Instructions Used

```assembly
assembly
addi x1, x0, 10
addi x2, x0, 20
sw   x2, 80(x1)
lw   x4, 80(x1)

jal_label:
beq  x4, x2, label
addi x5, x4, 50

label:
addi x5, x4, 400
jal  x6, jal_label
```


---

## Console Outputs

### Console Output 1


![Console Output 1](RISC-V_Multicycle/Console%20Output/Console_output1.png)


### Console Output 2


![Console Output 2](RISC-V_Multicycle/Console%20Output/Console_output2.png)


### Console Output 3


![Console Output 3](RISC-V_Multicycle/Console%20Output/Console_output3.png)


### Console Output 4


![Console Output 4](RISC-V_Multicycle/Console%20Output/Console_output4.png)


---

## Top-Level Waveforms

### Waveform Part 1


![Waveform Part 1](RISC-V_Multicycle/Output%20Waveforms/Multicycle1.png)


### Waveform Part 2


![Waveform Part 2](RISC-V_Multicycle/Output%20Waveforms/Multicycle2.png)


### Waveform Part 3


![Waveform Part 3](RISC-V_Multicycle/Output%20Waveforms/Multicycle3.png)


---

# 3. 5-Stage Pipelined RISC-V Processor with Hazard Handling

## Architecture

### Pipeline Block Diagram


![Pipeline Block Diagram](RISC-V_Pipeline_with_Hazards/Block%20Diagram/RISC-V_Pipelined_Block_Diagram.png)


### RTL Schematic (Vivado)


![Pipeline RTL Schematic](RISC-V_Pipeline_with_Hazards/Output%20Waveform/schemetic_pipeline.png)


---

## Instructions Used

```assembly
assembly
1  addi x1, x0, 10
2  addi x2, x0, 20
3  add  x3, x1, x2
4  sw   x2, 13(x1)
5  lw   x4, 13(x1)
6  beq  x4, x2, label
7  addi x5, x4, 50
8  addi x6, x5, 100

label:
9  addi x5, x4, 400
10 sub  x6, x5, x4
```


---

## Console Output


![Pipeline Console Output](RISC-V_Pipeline_with_Hazards/Console%20Output/Console_output.png)


---

## Top-Level Waveforms

### Waveform 1


![Pipeline Waveform 1](RISC-V_Pipeline_with_Hazards/Output%20Waveform/Full_waveform1.png)


### Waveform 2


![Pipeline Waveform 2](RISC-V_Pipeline_with_Hazards/Output%20Waveform/Full_waveform2.png)

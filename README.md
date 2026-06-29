# 1. Single-Cycle RISC-V Processor

## Architecture

### Block Diagram

```md
![Single Cycle Block Diagram](RISC-V_Single_Cycle/Block%20Diagram/RISC-V_Single_cycle_block_diagram.png)
```

### RTL Schematic (Vivado)

```md
![Single Cycle RTL Schematic](RISC-V_Single_Cycle/RTL_Schematic/schematic.png)
```

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

```md
![PC Testbench](RISC-V_Single_Cycle/Output_Waveforms/pc.png)
```

### Adder Testbench

```md
![Adder Testbench](RISC-V_Single_Cycle/Output_Waveforms/adder.png)
```

### Multiplexer Testbench

```md
![MUX Testbench](RISC-V_Single_Cycle/Output_Waveforms/mux.png)
```

### Immediate Generator Testbench

```md
![Immediate Generator](RISC-V_Single_Cycle/Output_Waveforms/imm.png)
```

### Instruction Memory Testbench

```md
![Instruction Memory](RISC-V_Single_Cycle/Output_Waveforms/instr.png)
```

### ALU Testbench

```md
![ALU Testbench](RISC-V_Single_Cycle/Output_Waveforms/alu.png)
```

### Main Decoder Testbench

```md
![Main Decoder](RISC-V_Single_Cycle/Output_Waveforms/main_decoder.png)
```

### Data Memory Testbench

```md
![Data Memory](RISC-V_Single_Cycle/Output_Waveforms/data_mem.png)
```

### Register File Testbench

```md
![Register File](RISC-V_Single_Cycle/Output_Waveforms/regfile.png)
```

### Top-Level Waveform

```md
![Top Module Waveform](RISC-V_Single_Cycle/Output_Waveforms/RISC-V_Single_Cycle_Top_Waveform.png)
```

---

# 2. Multicycle RISC-V Processor

## Architecture

### Block Diagram

```md
![Multicycle Block Diagram](RISC-V_Multicycle/Block_and_State_Diagrams/RISC-V_Multicyle_Block_Diagram.png)
```

### State Diagram

```md
![Multicycle State Diagram](RISC-V_Multicycle/Block_and_State_Diagrams/RISC-V_Multicylce_State_Diagram.png)
```

### RTL Schematic (Vivado)

```md
![Multicycle RTL Schematic](RISC-V_Multicycle/RTL_Schematic/schematic.png)
```

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

## Console Outputs

### Console Output 1

```md
![Console Output 1](RISC-V_Multicycle/Console_Output/Console_output1.png)
```

### Console Output 2

```md
![Console Output 2](RISC-V_Multicycle/Console_Output/Console_output2.png)
```

### Console Output 3

```md
![Console Output 3](RISC-V_Multicycle/Console_Output/Console_output3.png)
```

### Console Output 4

```md
![Console Output 4](RISC-V_Multicycle/Console_Output/Console_output4.png)
```

---

## Top-Level Waveforms

### Waveform Part 1

```md
![Waveform Part 1](RISC-V_Multicycle/Output_Waveforms/Multicycle1.png)
```

### Waveform Part 2

```md
![Waveform Part 2](RISC-V_Multicycle/Output_Waveforms/Multicycle2.png)
```

### Waveform Part 3

```md
![Waveform Part 3](RISC-V_Multicycle/Output_Waveforms/Multicycle3.png)
```

---

# 3. 5-Stage Pipelined RISC-V Processor with Hazard Handling

## Architecture

### Pipeline Block Diagram

```md
![Pipeline Block Diagram](RISC-V_Pipeline_with_Hazards/Block_Diagram/RISC-V_Pipelined_Block_Diagram.png)
```

### RTL Schematic (Vivado)

```md
![Pipeline RTL Schematic](RISC-V_Pipeline_with_Hazards/RTL_Schematic/schematic.png)
```

---

## Instructions Used

```assembly
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

```md
![Pipeline Console Output](RISC-V_Pipeline_with_Hazards/Console_Output/Console_output.png)
```

---

## Top-Level Waveforms

### Waveform 1

```md
![Pipeline Waveform 1](RISC-V_Pipeline_with_Hazards/Output_Waveforms/Full_waveform1.png)
```

### Waveform 2

```md
![Pipeline Waveform 2](RISC-V_Pipeline_with_Hazards/Output_Waveforms/Full_waveform2.png)
```

# 1. Single-Cycle RISC-V Processor

## Architecture

### Block Diagram

![Single Cycle Block Diagram](RISC-V_Single_Cycle/Block%20Diagram/RISC-V_Single_cycle_block_diagram.png)


### RTL Schematic (Vivado)

![Single Cycle RTL Schematic](RISC-V_Single_Cycle/RTL_Schematic/schematic.png)




## Instructions Used

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




## Output Waveforms

### Program Counter Testbench

![PC Testbench](RISC-V_Single_Cycle/Output_Waveforms/pc_tb.png)

### Adder Testbench

![Adder Testbench](RISC-V_Single_Cycle/Output_Waveforms/adder_tb.png)

### Multiplexer Testbench

![MUX Testbench](RISC-V_Single_Cycle/Output_Waveforms/mux_tb.png)

### Immediate Generator Testbench

![Immediate Generator](RISC-V_Single_Cycle/Output_Waveforms/imm_gen_tb.png)


### Instruction Memory Testbench

![Instruction Memory](RISC-V_Single_Cycle/Output_Waveforms/instruction_memory_tb.png)

### ALU Testbench

![ALU Testbench](RISC-V_Single_Cycle/Output_Waveforms/alu_tb.png)


### Main Decoder Testbench

![Main Decoder](RISC-V_Single_Cycle/Output_Waveforms/main_decoder_tb.png)


### Data Memory Testbench

![Data Memory](RISC-V_Single_Cycle/Output_Waveforms/data_memory_tb.png)


### Register File Testbench

![Register File](RISC-V_Single_Cycle/Output_Waveforms/register_file_tb.png)


### Top-Level Waveform

![Top Module Waveform](RISC-V_Single_Cycle/Output_Waveforms/top_module.png)



# 2. Multicycle RISC-V Processor

## Architecture

### Block Diagram

![Multicycle Block Diagram](RISC-V_Multicycle/Block_and_State_Diagrams/block_diagram.png)

### State Diagram

![Multicycle State Diagram](RISC-V_Multicycle/Block_and_State_Diagrams/state_diagram.png)


### RTL Schematic (Vivado)

![Multicycle RTL Schematic](RISC-V_Multicycle/RTL_Schematic/schematic.png)


## Instructions Used

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



## Console Outputs

### Console Output 1

![Console Output 1](RISC-V_Multicycle/Console_Output/console_1.png)


### Console Output 2

![Console Output 2](RISC-V_Multicycle/Console_Output/console_2.png)

### Console Output 3

![Console Output 3](RISC-V_Multicycle/Console_Output/console_3.png)

### Console Output 4

![Console Output 4](RISC-V_Multicycle/Console_Output/console_4.png)



## Top-Level Waveforms

### Waveform Part 1

![Waveform Part 1](RISC-V_Multicycle/Output_Waveforms/waveform_1.png)


### Waveform Part 2

![Waveform Part 2](RISC-V_Multicycle/Output_Waveforms/waveform_2.png)

### Waveform Part 3

![Waveform Part 3](RISC-V_Multicycle/Output_Waveforms/waveform_3.png)



# 3. 5-Stage Pipelined RISC-V Processor with Hazard Handling

## Architecture

### Pipeline Block Diagram

![Pipeline Block Diagram](RISC-V_Pipeline_with_Hazards/Block_Diagram/pipeline_block_diagram.png)

### RTL Schematic (Vivado)

![Pipeline RTL Schematic](RISC-V_Pipeline_with_Hazards/RTL_Schematic/schematic.png)



## Instructions Used

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




## Console Output

![Pipeline Console Output](RISC-V_Pipeline_with_Hazards/Console_Output/console_output.png)

## Top-Level Waveforms

### Waveform 1

![Pipeline Waveform 1](RISC-V_Pipeline_with_Hazards/Output_Waveforms/waveform_1.png)

### Waveform 2


![Pipeline Waveform 2](RISC-V_Pipeline_with_Hazards/Output_Waveforms/waveform_2.png)

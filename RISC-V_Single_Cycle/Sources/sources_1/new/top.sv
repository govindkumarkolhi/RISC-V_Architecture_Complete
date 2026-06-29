`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 04:21:48 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input logic rst,
    input logic clk
);

logic [31:0] count_pc;
logic [31:0] instruction;
logic [31:0] pc_adder;
logic [31:0] branch_adder;
logic [31:0] mux1_out;

logic [31:0] imm_out;

logic [31:0] read_data1;
logic [31:0] read_data2;

logic [31:0] alu_in2;
logic [31:0] alu_result;
logic         zero_flag;

logic [31:0] mem_data;

logic [31:0] write_back;

// wires for main decoder output
logic       RegWrite;
logic       ALUSrc;
logic       MemWrite;
logic       MemRead;
logic [1:0] ResultSrc;
logic       Branch;
logic [2:0] ALUcontrol;
logic [1:0] ALUOp;

logic PCSrc;
logic jump;

logic [31:0] pc_plus4;
// Branch target address
adder_32_bit first_adder_out(
    .A(count_pc),
    .B(32'd4),
    .sum(pc_plus4)
);

program_counter uut(
    .clk(clk),
    .rst(rst),
    .muxin(mux1_out),
    .count(count_pc)
);

// Next PC mux
mux_2_to_1 uut10(
    .A(pc_plus4),
    .B(branch_adder),
    .sel(PCSrc),
    .out(mux1_out)
);

// Branch target address
adder_32_bit uut9(
    .A(count_pc),
    .B(imm_out),
    .sum(branch_adder)
);

// Instruction Memory
inst_mem uut1(
    .pc(count_pc),
    .instruction_code(instruction)
);

// Main Decoder
main_decoder uut4(
    .Op(instruction[6:0]),
    .func3(instruction[14:12]),
    .func7_5(instruction[30]),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .ALUcontrol(ALUcontrol),
    .ALUOp(ALUOp),
    .Jump(jump)
);

// ALU input mux
assign alu_in2 = (ALUSrc) ? imm_out : read_data2; //1 -> imm_out, 0 -> readData2

// ALU
ALU uut7(
    .in1(read_data1),
    .in2(alu_in2),
    .alu_control(ALUcontrol),
    .result(alu_result),
    .zero_flag(zero_flag)
);
 
// Branch decision
assign PCSrc = jump | (Branch & zero_flag);

// Register File
reg_file uut5(
    .read_reg_num1(instruction[19:15]),
    .read_reg_num2(instruction[24:20]),
    .write_reg(instruction[11:7]),
    .write_data(write_back), //for data writing in register
    .read_data1(read_data1),
    .read_data2(read_data2),
    .regwrite(RegWrite),
    .clock(clk),
    .reset(rst)
);

// Immediate Generator
imm_gen uut6(
    .instruction(instruction),
    .imm_out(imm_out)
);

// Data Memory
data_mem uut8(
    .clk(clk),
    .mem_write(MemWrite),
    .address(alu_result),
    .data_in(read_data2),
    .data_out(mem_data)
);

// Write-back mux
mux_3_to_1 uut12 (.a(alu_result), .b(mem_data), .c(pc_plus4), .out3(write_back), .sel(ResultSrc));

endmodule
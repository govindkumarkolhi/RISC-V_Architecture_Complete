`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 02:48:31 PM
// Design Name: 
// Module Name: inst_mem
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


module inst_mem(
input logic [31:0] pc, 
output logic [31:0] instruction_code
);

logic [7:0] Memory [31:0]; //byte adressable memory 32 byte

//initialize memory at simulation start

initial begin 

// Instruction 0 (PC=0): addi x1, x0, 10
Memory[0] = 8'h93;
Memory[1] = 8'h00;
Memory[2] = 8'ha0;
Memory[3] = 8'h00;

// Instruction 1 (PC=4): addi x2, x0, 20
Memory[4] = 8'h13;
Memory[5] = 8'h01;
Memory[6] = 8'h40;
Memory[7] = 8'h01;

// Instruction 2 (PC=8): sw x2, 80(x1)
Memory[8]  = 8'h23;
Memory[9]  = 8'ha8;
Memory[10] = 8'h20;
Memory[11] = 8'h04;

// Instruction 3 (PC=12): lw x4, 80(x1)
Memory[12] = 8'h03;
Memory[13] = 8'ha2;
Memory[14] = 8'h00;
Memory[15] = 8'h05;

// Instruction 4 (PC=16): beq x4, x2, offset +8
// If x4 == x2, it jumps to PC=24 (label)
Memory[16] = 8'h63;
Memory[17] = 8'h04;
Memory[18] = 8'h22;
Memory[19] = 8'h00;

// Instruction 5 (PC=20): addi x5, x4, 50
// Executes only if the branch above is NOT taken
Memory[20] = 8'h93;
Memory[21] = 8'h02;
Memory[22] = 8'h22;
Memory[23] = 8'h03;

// Instruction 6 (PC=24): addi x5, x4, 400
// Branch target (label)
Memory[24] = 8'h93;
Memory[25] = 8'h02;
Memory[26] = 8'h02;
Memory[27] = 8'h19;

// Instruction 7 (PC=28): jal x6, -12
// Stores return address (PC+4 = 32) in x6 and jumps back to PC=16
// (the beq instruction)
Memory[28] = 8'h6f;
Memory[29] = 8'hf3;
Memory[30] = 8'h5f;
Memory[31] = 8'hff;

end

assign instruction_code = {Memory[pc+3], Memory[pc+2], Memory[pc+1], Memory[pc]};


endmodule

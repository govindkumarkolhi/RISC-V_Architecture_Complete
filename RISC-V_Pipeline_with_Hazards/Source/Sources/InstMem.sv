`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2026 01:47:46 AM
// Design Name: 
// Module Name: InstMem
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


module InstMem(
input logic [31:0] A, 
output logic [31:0] RD
);

logic [7:0] Memory [40:0]; //byte adressable memory 32 byte

//initialize memory at simulation start

initial begin       

//        Instructions Given in Lab to verify
//        // Instruction 0 (A=0): add x0 x1 x2
//        Memory[0] = 8'h33;
//        Memory[1] = 8'h80;
//        Memory[2] = 8'h20;
//        Memory[3] = 8'h00;
        
//        // Instruction 1 (A=4): sub x0 x3 x4
//        Memory[4] = 8'h33;
//        Memory[5] = 8'h80;
//        Memory[6] = 8'h41;
//        Memory[7] = 8'h40;

//        // Instruction 2 (A=8): and x5 x0 x0 
//        Memory[8] = 8'hb3;
//        Memory[9] = 8'h72;
//        Memory[10] = 8'h00;
//        Memory[11] = 8'h00;


//Instructions to Run below
//addi x1 x0 10
//addi x2 x0 20
//add x3 x1 x2
//sw x2 13(x1)
//lw x4 13(x1)
//beq x4 x2 label
//addi x5 x4 50
//addi x6 x5 100
//label:
//addi x5 x4 400 
//sub x6 x5 x4

        // Instruction 0 (A=0): addi x1 x0 10 
        Memory[0] = 8'h93;
        Memory[1] = 8'h00;
        Memory[2] = 8'ha0;
        Memory[3] = 8'h00;
        
        // Instruction 1 (A=4): addi x2 x0 20
        Memory[4] = 8'h13;
        Memory[5] = 8'h01;
        Memory[6] = 8'h40;
        Memory[7] = 8'h01;
        
        // Instruction 2 (A=8): add x3, x1, x2
        Memory[8] = 8'hb3;
        Memory[9] = 8'h81;
        Memory[10] = 8'h20;
        Memory[11] = 8'h00;

        // Instruction 3 (A=12): sw x2 13(x1)
        Memory[12] = 8'ha3;
        Memory[13] = 8'ha6;
        Memory[14] = 8'h20;
        Memory[15] = 8'h00;

        // Instruction 4 (A=16): lw x4 13(x1)
        Memory[16] = 8'h03;
        Memory[17] = 8'ha2;
        Memory[18] = 8'hd0;
        Memory[19] = 8'h00;
        
        // Instruction 5 (A=20): beq x4 x2 12
        Memory[20] = 8'h63;
        Memory[21] = 8'h06;
        Memory[22] = 8'h22;
        Memory[23] = 8'h00;

        // Instruction 6 (A=24): addi x5 x4 50
        Memory[24] = 8'h93;
        Memory[25] = 8'h02;
        Memory[26] = 8'h22;
        Memory[27] = 8'h03;

        // Instruction 7 (A=28): addi x6 x5 100
        Memory[28] = 8'h13;
        Memory[29] = 8'h83;
        Memory[30] = 8'h42;
        Memory[31] = 8'h06;

        // Instruction 8 (A=32): addi x5 x4 400
        Memory[32] = 8'h93;
        Memory[33] = 8'h02;
        Memory[34] = 8'h02;
        Memory[35] = 8'h19;

        // Instruction 9 (A=34): sub x6 x5 x4
        Memory[36] = 8'h33;
        Memory[37] = 8'h83;
        Memory[38] = 8'h42;
        Memory[39] = 8'h40;


        
end

assign RD = {Memory[A+3], Memory[A+2], Memory[A+1], Memory[A]};


endmodule

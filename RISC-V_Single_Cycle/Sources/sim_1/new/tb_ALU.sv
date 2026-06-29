`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 06:13:37 PM
// Design Name: 
// Module Name: tb_ALU
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

`timescale 1ns / 1ps

module tb_ALU();

logic [31:0] in1, in2;
logic [2:0] alu_control;
logic [31:0] result;
logic zero_flag;

ALU uut(.*);

initial begin

    in1 = 0;
    in2 = 0;
    alu_control = 0;

    // AND
    #10;
    in1 = 32'hF0F0F0F0;
    in2 = 32'h0F0F0F0F;
    alu_control = 3'b000;

    // OR
    #10;
    in1 = 32'hF0F0F0F0;
    in2 = 32'h0F0F0F0F;
    alu_control = 3'b001;

    // ADD
    #10;
    in1 = 20;
    in2 = 15;
    alu_control = 3'b010;

    // SUB
    #10;
    in1 = 20;
    in2 = 15;
    alu_control = 3'b110;

    // BEQ equal
    #10;
    in1 = 100;
    in2 = 100;
    alu_control = 3'b011;

    // BEQ not equal
    #10;
    in1 = 100;
    in2 = 50;
    alu_control = 3'b011;

    // Default case
    #10;
    in1 = 5;
    in2 = 3;
    alu_control = 3'b111;

    #10;
    $finish;

end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 04:16:53 PM
// Design Name: 
// Module Name: tb_decoder
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


module tb_decoder();

    logic [31:0] instruction;
    logic [2:0] func3;
    logic [6:0] func7; 
    logic [4:0] rs1, rs2, rd;
    logic [11:0] imm;

decoder uut(.instruction(instruction), .func3(func3), .func7(func7), .rs1(rs1), .rs2(rs2), .rd(rd), .imm(imm));


initial begin


instruction = 32'h00940333; #20;
instruction = 32'h01bd5f33; #20;
instruction = 32'h0064a423; #20;
instruction = 32'hffc4a304; #20;

$finish;

end


endmodule

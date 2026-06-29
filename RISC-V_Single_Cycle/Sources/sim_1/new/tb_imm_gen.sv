`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 02:49:25 PM
// Design Name: 
// Module Name: tb_imm_gen
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


module tb_imm_gen();

logic [31:0] instruction;
logic [31:0] imm_out;

imm_gen uut (.*);

initial begin 
instruction = 32'h0;
#20;
// L type 
instruction = 32'hFFC4A303; #20; //1111 1111 1100 0100 1010 0011 0000 0011 


// S type 
instruction = 32'h0064A4A3; #20; //0000 0000 0110 0100 1010 0100 1010 0011

// B type 
instruction = 32'h0064A463; #20; //0000 0000 0110 0100 1010 0100 0110 0011

$finish;



end
endmodule

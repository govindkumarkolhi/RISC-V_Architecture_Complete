`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 03:05:10 PM
// Design Name: 
// Module Name: tb_adder_32_bit
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


module tb_adder_32_bit();
logic [31:0] A, B, sum; 

adder_32_bit uut(.*);

initial begin 
A = 32'b0;
B = 32'b0;
#20;

A = 32'hdeafbeef;
B = 32'hfefafefe;
#20;


A = 32'hffffffff;
B = 32'hffffffff;
#20;



end 

endmodule

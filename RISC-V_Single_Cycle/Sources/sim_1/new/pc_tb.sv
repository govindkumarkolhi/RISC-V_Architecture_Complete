`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 02:32:33 PM
// Design Name: 
// Module Name: pc_tb
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


module pc_tb();
logic clk, rst;
logic [31:0]count;


program_counter uut(.clk(clk), .rst(rst), .count(count));


always #5 clk = ~clk;

initial begin 
clk = 1'b0;


rst = 1'b1;
#20;

rst = 1'b0;
#300;


$finish;
end 



endmodule

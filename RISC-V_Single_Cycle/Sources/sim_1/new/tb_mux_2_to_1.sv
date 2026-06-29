`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 03:17:45 PM
// Design Name: 
// Module Name: tb_mux_2_to_1
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


module tb_mux_2_to_1();

logic [31:0] A, B, out;
logic sel;

mux_2_to_1 uut(.*);


initial begin 
A = 32'b0;
B = 32'b0;
sel = 1'b0;
#20;

A = 32'hdeafbeef;
B = 32'hfefafefe;
sel = 1'b0;

#20;

A = 32'hdeafbeef;
B = 32'hfefafefe;
sel = 1'b1;

#20;



A = 32'hffffffff;
B = 32'hffffffff;
sel = 1'b0;

#20;


A = 32'hffffffff;
B = 32'hffffffff;
sel = 1'b1;

#20;

$finish;

end


endmodule

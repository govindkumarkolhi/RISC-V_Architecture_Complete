`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2026 05:06:32 PM
// Design Name: 
// Module Name: WriteBack
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


module WriteBack(
input logic RegWriteW,
input logic [31:0] ALUResultW, ReadDataW, PCPlus4W,
input logic [4:0] RdW,
input logic [1:0] ResultSrcW,

output logic [31:0] ResultW
    );
    
    Mux3 mux(ALUResultW, ReadDataW, PCPlus4W, ResultSrcW, ResultW); //format: in1, in2, in3, sel, out
endmodule

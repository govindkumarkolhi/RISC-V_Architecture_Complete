`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2026 12:12:36 PM
// Design Name: 
// Module Name: Reg_ALU
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


module Reg_ALU(
input logic CLK, rst,
input logic [31:0] ALUResult, 
output logic [31:0] ALUOut
);



always_ff @(posedge CLK or posedge rst) begin
    if(rst)
        ALUOut <= 32'd0;
    else  
        ALUOut <= ALUResult;
end

endmodule



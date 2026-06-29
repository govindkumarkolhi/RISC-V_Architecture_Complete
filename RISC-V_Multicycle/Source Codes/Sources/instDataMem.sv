`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2026 10:49:31 AM
// Design Name: 
// Module Name: instDataMem
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


module instDataMem(
    input  logic        CLK,
    input  logic        WE,
    input  logic [31:0] A,
    input  logic [31:0] WD,
    output logic [31:0] RD
);

logic [7:0] Memory [1023:0];//byte addresible

initial begin
    $readmemh("memory_init.mem", Memory);
end

always_ff @(posedge CLK) begin
    if (WE) begin 
        Memory[A] <= WD[7:0];
        Memory[A + 1] <= WD[15:8];
        Memory[A + 2] <= WD[23:16];
        Memory[A + 3] <= WD[31:24];
        end
end

always_comb begin
        RD [7:0] <= Memory[A];
        RD [15:8] <= Memory[A + 1];
        RD [23:16] <= Memory[A + 2];
        RD [31:24] <= Memory[A + 3];
end

endmodule
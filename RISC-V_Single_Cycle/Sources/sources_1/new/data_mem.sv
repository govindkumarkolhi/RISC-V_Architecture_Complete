`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 06:18:49 PM
// Design Name: 
// Module Name: data_mem
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

module data_mem(
input logic clk, mem_write, 
input logic [31:0] address, data_in, 
output logic [31:0] data_out 
);

//1 KB byte-adressable memory 
logic [7:0] memory [1023:0];
    // Write: synchronous
    always @(posedge clk) begin 
        if (mem_write) begin 
            memory[address]     <= data_in[7:0];
            memory[address + 1] <= data_in[15:8];
            memory[address + 2] <= data_in[23:16];
            memory[address + 3] <= data_in[31:24];
        end
    end

    // Read: combinational
    assign data_out = {memory[address + 3],
                       memory[address + 2],
                       memory[address + 1],
                       memory[address]};


endmodule

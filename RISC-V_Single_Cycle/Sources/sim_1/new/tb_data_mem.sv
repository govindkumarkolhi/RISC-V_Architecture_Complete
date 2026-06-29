`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 06:31:44 PM
// Design Name: 
// Module Name: tb_data_mem
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



module tb_data_mem();

logic clk;
logic mem_read;
logic mem_write;
logic [31:0] address;
logic [31:0] data_in;
logic [31:0] data_out;

data_mem uut(
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    mem_read = 0;
    mem_write = 0;
    address = 0;
    data_in = 0;

    // Write 0xDEADBEEF at address 0
    #10;
    mem_write = 1;
    address = 32'd0;
    data_in = 32'hDEADBEEF;

    #10;
    mem_write = 0;

    // Read from address 0
    #10;
    mem_read = 1;
    address = 32'd0;

    #10;
    mem_read = 0;

    // Write 0x12345678 at address 4
    #10;
    mem_write = 1;
    address = 32'd4;
    data_in = 32'h12345678;

    #10;
    mem_write = 0;

    // Read from address 4
    #10;
    mem_read = 1;
    address = 32'd4;

    #10;
    mem_read = 0;

    #20;
    $finish;

end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2026 01:54:14 AM
// Design Name: 
// Module Name: top_tb
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


module tb_top;

logic clk;
logic rst;

top dut (
    .clk(clk),
    .rst(rst)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset generation
initial begin
    rst = 1;
    #20;
    rst = 0;
end

// Monitor signals
// Monitor signals
initial begin
    $display("Time\tPC\t\tInstr\t\t\tRS1\tRS2\tRD\tALU_Result\tMem_Data");

    $monitor("%0t\t%h\t%h\t%0d\t%0d\t%0d\t%h\t%h",
             $time,
             dut.count_pc,
             dut.instruction,
             dut.uut5.read_reg_num1,
             dut.uut5.read_reg_num2,
             dut.uut5.write_reg,
             dut.alu_result,
             dut.mem_data);
end

// Stop simulation
initial begin
    #180;
    $finish;
end

endmodule
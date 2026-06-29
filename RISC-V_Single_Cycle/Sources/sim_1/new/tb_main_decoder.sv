`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 03:34:11 PM
// Design Name: 
// Module Name: tb_main_decoder
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


module tb_main_decoder;

logic  [6:0] Op;
logic       RegWrite;
logic [1:0] ImmSrc;
logic       ALUSrc;
logic       MemWrite;
logic       ResultSrc;
logic       Branch;
logic [1:0] ALUOp;

main_decoder dut(
    .Op(Op),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .ALUOp(ALUOp)
);

initial begin
    $display("---------------------------------------------------------------");
    $display(" Op       RegWrite ImmSrc ALUSrc MemWrite ResultSrc Branch ALUOp");
    $display("---------------------------------------------------------------");

    // lw
    Op = 7'b0000011;
    #10;
    $display("%b     %b       %b      %b       %b        %b        %b     %b",
              Op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

    // sw
    Op = 7'b0100011;
    #10;
    $display("%b     %b       %b      %b       %b        %b        %b     %b",
              Op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

    // R-type
    Op = 7'b0110011;
    #10;
    $display("%b     %b       %b      %b       %b        %b        %b     %b",
              Op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

    // beq
    Op = 7'b1100011;
    #10;
    $display("%b     %b       %b      %b       %b        %b        %b     %b",
              Op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

    // invalid opcode
    Op = 7'b1111111;
    #10;
    $display("%b     %b       %b      %b       %b        %b        %b     %b",
              Op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

    $display("---------------------------------------------------------------");
    $finish;
end

endmodule
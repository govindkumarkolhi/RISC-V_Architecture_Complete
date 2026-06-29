`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2026 11:14:57 AM
// Design Name: 
// Module Name: OldPC_reg
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


module OldPC_reg(
input logic CLK, EN, rst,
input logic [31:0] PC, ReadData,  
output logic [31:0] OldPC, Instr
);



always_ff @(posedge CLK or posedge rst) begin
    if(rst) begin 
        OldPC <= 32'd0;
        Instr <= 32'd0;    
    end
    else begin 
        if (EN) begin 
            OldPC <= PC;
            Instr <= ReadData;
        end    
        else begin 
            OldPC <= OldPC;
            Instr <= Instr;        
        end
        end
end

endmodule


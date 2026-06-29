`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2026 11:50:06 AM
// Design Name: 
// Module Name: RegFile_reg
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


module RegFile_reg(

input logic CLK, rst,
input logic [31:0] RD1, RD2,  
output logic [31:0] A, WriteData
);



always_ff @(posedge CLK or posedge rst) begin
    if(rst) begin 
        A <= 32'd0;
        WriteData <= 32'd0;    
    end
    else begin 
            A <= RD1;
            WriteData <= RD2;
        end
end

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 02:28:43 PM
// Design Name: 
// Module Name: program_counter
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
module program_counter(
input logic CLK, EN, rst,
input logic [31:0] PCNext, 
output logic [31:0] PC
);



always_ff @(posedge CLK or posedge rst) begin
    if(rst)
        PC <= 32'd0;
    else begin 
        if (EN)
            PC <= PCNext;
        else 
            PC <= PC;
        end
end

endmodule


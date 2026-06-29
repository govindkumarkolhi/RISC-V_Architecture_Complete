`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2026 02:43:32 PM
// Design Name: 
// Module Name: ALUControl
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


module ALU_Control(
input logic [1:0] ALUOp,
input logic [2:0] func3,
input logic func7_5,
input logic op5,
output logic [2:0] ALUControl
);
    
       parameter   ALU_ADD = 3'b000, 
                 ALU_SUB = 3'b001, 
                 ALU_AND = 3'b010, 
                 ALU_OR  = 3'b011, 
                 ALU_XOR = 3'b100, 
                 ALU_SLL = 3'b101, 
                 ALU_SRL = 3'b110;
 
     always_comb begin
         case (ALUOp)
             2'b00: ALUControl = ALU_ADD; 
             2'b01: ALUControl = ALU_SUB; 
             
             2'b10: begin
                 case (func3)
                     3'b000:  
                        begin 
                        if({op5, func7_5}  == 2'b11)
                            ALUControl = ALU_SUB;
                        else 
                            ALUControl = ALU_ADD;
                        end
                     3'b001:  ALUControl = ALU_SLL;                      
                     3'b100:  ALUControl = ALU_XOR;                      
                     3'b101:  ALUControl = ALU_SRL;                      
                     3'b110:  ALUControl = ALU_OR;                       
                     3'b111:  ALUControl = ALU_AND;                      
                     default: ALUControl = ALU_ADD;
                 endcase
             end
 
 
             default: ALUControl = ALU_ADD;
         endcase
     end
     
    
endmodule

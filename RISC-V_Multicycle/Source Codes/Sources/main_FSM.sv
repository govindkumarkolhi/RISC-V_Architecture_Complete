`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2026 02:52:55 PM
// Design Name: 
// Module Name: main_FSM
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


module main_FSM(
    input logic CLK,
    input logic rst,
    input logic [6:0] op,
    
    output logic       Branch,
    output logic       PCUpdate,
    output logic       RegWrite,
    output logic       MemWrite,
    output logic       IRWrite,  
      
    output logic [1:0] ResultSrc,
    output logic [1:0] ALUSrcA,
    output logic [1:0] ALUSrcB,

    output logic       AdrSrc,
    
    output logic [1:0] ALUOp
);

    // State encoding
    parameter S0 = 4'b0000,
              S1 = 4'b0001,
              S2 = 4'b0010,
              S3 = 4'b0011,
              S4 = 4'b0100,
              S5 = 4'b0101,
              S6 = 4'b0110,
              S7 = 4'b0111,
              S8 = 4'b1000,
              S9 = 4'b1001,
              S10 = 4'b1010;



  logic [3:0] state, next_state;

    // State register
    always @(posedge CLK or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: begin
                    case (op)
                        7'b0000011, 7'b0100011: next_state = S2;
                        7'b0110011:             next_state = S6;
                        7'b0010011:             next_state = S8;
                        7'b1101111:             next_state = S9;
                        7'b1100011:             next_state = S10; 
                        default:                next_state = S0;
                    endcase     
                end
            S2: begin 
                    case (op)
                        7'b0000011: next_state = S3;
                        7'b0100011:             next_state = S5; 
                        default:                next_state = S0;
                    endcase                
                end
   
            S3: next_state = S4 ;
            S4: next_state = S0;
            S5: next_state = S0;
   
            S6: next_state = S7;
            S7: next_state = S0;
            S8: next_state = S7;
            S9: next_state = S7;

            S10: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        
        //default values 
        Branch =    1'b0;
        PCUpdate =  1'b0;
        RegWrite =  1'b0;
        MemWrite =  1'b0;
        IRWrite =   1'b0;
        
        ResultSrc = 2'b00;
        ALUSrcB =   2'b00;
        ALUSrcA =   2'b00;
        
        AdrSrc =   1'b0;
        
        ALUOp =    2'b00;
        
        case (state)
        S0: begin 
                Branch =    1'b0;
                PCUpdate =  1'b1;
                RegWrite =  1'b0;
                MemWrite =  1'b0;
                IRWrite =   1'b1;
        
                ResultSrc = 2'b10;
                ALUSrcB =   2'b10;
                ALUSrcA =   2'b00;
        
                AdrSrc =   1'b0;
        
                ALUOp =    2'b00;            
            end
            
        S1: begin
                Branch =    1'b0;
                PCUpdate =  1'b0;
                RegWrite =  1'b0;
                MemWrite =  1'b0;
                IRWrite =   1'b0;

                ResultSrc = 2'bxx;
                ALUSrcB =   2'b01;
                ALUSrcA =   2'b01;

                AdrSrc =   1'bx;

                ALUOp =    2'b00;                       
            end
        

        S2: begin 
                Branch =    1'b0;
                PCUpdate =  1'b0;
                RegWrite =  1'b0;
                MemWrite =  1'b0;
                IRWrite =   1'b0;
        
                ResultSrc = 2'bxx;
                ALUSrcB =   2'b01;
                ALUSrcA =   2'b10;
        
                AdrSrc =   1'bx;
        
                ALUOp =    2'b00;            
            end
            
        S3: begin
                Branch =    1'b0;
                PCUpdate =  1'b0;
                RegWrite =  1'b0;
                MemWrite =  1'b0;
                IRWrite =   1'b0;

                ResultSrc = 2'b00;
                ALUSrcB =   2'bxx;
                ALUSrcA =   2'bxx;

                AdrSrc =   1'b1;

                ALUOp =    2'bxx;                       
            end


        S4: begin 
                Branch =    1'b0;
                PCUpdate =  1'b0;
                RegWrite =  1'b1;
                MemWrite =  1'b0;
                IRWrite =   1'b0;
        
                ResultSrc = 2'b01;
                ALUSrcB =   2'bxx;
                ALUSrcA =   2'bxx;
        
                AdrSrc =   1'bx;
        
                ALUOp =    2'bxx;            
            end
       
        S5: begin
                Branch =    1'b0;
                PCUpdate =  1'b0;
                RegWrite =  1'b0;
                MemWrite =  1'b1;
                IRWrite =   1'b0;

                ResultSrc = 2'b00;
                ALUSrcB =   2'bxx;
                ALUSrcA =   2'bxx;

                AdrSrc =   1'b1;

                ALUOp =    2'bxx;                       
            end

        S6: begin 
                Branch =    1'b0;
                PCUpdate =  1'b0;
                RegWrite =  1'b0;
                MemWrite =  1'b0;
                IRWrite =   1'b0;
        
                ResultSrc = 2'bxx;
                ALUSrcB =   2'b00;
                ALUSrcA =   2'b10;
        
                AdrSrc =   1'bx;
        
                ALUOp =    2'b10;            
            end
        
        S7: begin
                Branch =    1'b0;
                PCUpdate =  1'b0;
                RegWrite =  1'b1;
                MemWrite =  1'b0;
                IRWrite =   1'b0;

                ResultSrc = 2'b00;
                ALUSrcB =   2'bxx;
                ALUSrcA =   2'bxx;

                AdrSrc =   1'bx;

                ALUOp =    2'bxx;                       
            end


        S8: begin 
                Branch =    1'b0;
                PCUpdate =  1'b0;
                RegWrite =  1'b0;
                MemWrite =  1'b0;
                IRWrite =   1'b0;
        
                ResultSrc = 2'bxx;
                ALUSrcB =   2'b01;
                ALUSrcA =   2'b10;
        
                AdrSrc =   1'bx;
        
                ALUOp =    2'b10;            
            end
        
        S9: begin
                Branch =    1'b0;
                PCUpdate =  1'b1;
                RegWrite =  1'b0;
                MemWrite =  1'b0;
                IRWrite =   1'b0;

                ResultSrc = 2'b00;
                ALUSrcB =   2'b10;
                ALUSrcA =   2'b01;

                AdrSrc =   1'bx;

                ALUOp =    2'b00;                       
            end

        S10: begin
                Branch =    1'b1;
                PCUpdate =  1'b0;
                RegWrite =  1'b0;
                MemWrite =  1'b0;
                IRWrite =   1'b0;

                ResultSrc = 2'b00;
                ALUSrcB =   2'b00;
                ALUSrcA =   2'b10;

                AdrSrc =   1'bx;

                ALUOp =    2'b01;                       
            end
                
        default: begin 
                 Branch =    1'b0;
                 PCUpdate =  1'b0;
                 RegWrite =  1'b0;
                 MemWrite =  1'b0;
                 IRWrite =   1'b0;

                 ResultSrc = 2'b00;
                 ALUSrcB =   2'b00;
                 ALUSrcA =   2'b00;

                 AdrSrc =   1'b0;

                 ALUOp =    2'b00;               
                 end  
     
        
        
        endcase
        



    end

endmodule

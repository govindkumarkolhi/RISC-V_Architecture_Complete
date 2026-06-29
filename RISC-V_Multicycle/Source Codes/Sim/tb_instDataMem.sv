`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2026 12:28:32 PM
// Design Name: 
// Module Name: tb_instDataMem
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


module tb_instDataMem();

logic CLK, WE;
logic [31:0] A, WD;
logic [31:0] RD;

instDataMem uut(.*);


always #5 CLK = ~CLK;

initial begin 
CLK = 0;
A = 0;
WD = 0;
#10;
    
    
    
    A = 32'D0;
    #20;
    A = 32'D4;
    #20;
    A = 32'D8;
    #20;
    A = 32'D12;
    #20;
    A = 32'D16;
    #20;
    A = 32'D20;
    #20;
    A = 32'D24;
    #20;
    A = 32'D28;
    #20;
    A = 32'D32;
    #30;
    A = 32'd36;
    #20;

    A = 32'D40;
    #20;
    A = 32'D44;
    #20;
    A = 32'D48;
    #20;
    A = 32'D52;
    #20;
    A = 32'D56;
    #20;
    A = 32'D60;
    #20;
    A = 32'D64;
    #20;
    A = 32'D68;
    #20;
    A = 32'D72;
    #30;
    A = 32'd76;
    #20;

    
    A = 32'd80;
    #20;
    $finish;
        

end



endmodule

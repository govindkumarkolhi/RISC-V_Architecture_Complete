`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 05:25:41 PM
// Design Name: 
// Module Name: tb_reg_file
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


module tb_reg_file();

 logic [4:0] read_reg_num1;
 logic [4:0] read_reg_num2;
 logic [4:0] write_reg;
 logic[31:0] write_data;
 logic[31:0] read_data1;
 logic[31:0] read_data2;
 logic regwrite;
 logic clock;
 logic reset;
    

reg_file uut(.*);


always #5 clock = ~clock;


initial begin 
clock = 0;
reset = 1;
regwrite = 0;
read_reg_num1 = 0;
read_reg_num2 = 0;
write_reg = 0;
write_data = 0;


#10 ; reset = 0;
 //write value 10 to reg x5
#10 regwrite = 1;
write_reg = 5;
write_data = 10;
#10 regwrite = 0;

//read x5 
read_reg_num1 = 5;

#10 regwrite = 0;
write_reg = 5;
#10 regwrite = 0;



#10 regwrite = 1;
write_reg = 6;
write_data = 32'hfefabebe;
#10 regwrite = 0;

//read x5 
read_reg_num1 = 5;

#10 regwrite = 1;
write_reg = 3;
write_data = 32'haaaabbbb;
#10 regwrite = 0;





end 

endmodule
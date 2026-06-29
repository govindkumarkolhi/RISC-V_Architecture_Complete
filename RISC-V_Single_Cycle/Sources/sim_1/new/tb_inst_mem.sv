`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 03:26:18 PM
// Design Name: 
// Module Name: tb_inst_mem
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


module tb_inst_mem();
logic [31:0]pc, instruction_code;

inst_mem uut(.pc(pc), .instruction_code(instruction_code));

initial begin 
$display("Time\tpc\t\tinstruction_code");
$monitor("%0t\t%h\t%h", $time, pc, instruction_code );
end

initial begin
pc = 32'd0; #20;
pc = 32'd4; #20;
pc = 32'd8; #20;
pc = 32'd12; #20;
pc = 32'd16; #20;
pc = 32'd20; #20;
pc = 32'd24; #20;
pc = 32'd28; #20;


end



endmodule

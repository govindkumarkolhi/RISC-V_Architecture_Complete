
//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 06/18/2026 01:54:14 AM
//// Design Name: 
//// Module Name: top_tb
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//`timescale 1ns/1ps

//module top_tb;


//    logic CLK;
//    logic rst;


//    top DUT (
//        .CLK(CLK),
//        .rst(rst)
//    );


//    initial begin
//        CLK = 0;
//        forever #5 CLK = ~CLK;   
//    end


//    initial begin
//        rst = 1;
//        #20;
//        rst = 0;

//        #1000;
//        $finish;
//    end

  
//   initial begin
//    $display("-------------------------------------------------------------------------------------------------------------");
//    $display("|  PC   | Instr    | RD1      | RD2      | Imm      | SrcA     | SrcB     | ALURes   | Result");
//    $display("-------------------------------------------------------------------------------------------------------------");
//end

//always @(posedge CLK) begin
//    $display("%08h | %08h | %08h | %08h | %08h | %08h | %08h | %08h | %08h",
//        DUT.PC,
//        DUT.Instr,
//        DUT.RD1,
//        DUT.RD2,
//        DUT.ImmExt,
//        DUT.SrcA,
//        DUT.SrcB,
//        DUT.ALUResult,
//        DUT.Result
//    );
//end
//endmodule


`timescale 1ns/1ps

module top_tb;

    logic CLK;
    logic rst;

    top DUT (
        .CLK(CLK),
        .rst(rst)
    );

    //--------------------------------------------------
    // Clock
    //--------------------------------------------------
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    //--------------------------------------------------
    // Reset
    //--------------------------------------------------
    initial begin
        rst = 1;
        #20;
        rst = 0;

        #2000;
        $finish;
    end

    //--------------------------------------------------
    // State decoder
    //--------------------------------------------------
    function string state_name(input logic [3:0] st);
    begin
        case(st)
            4'd0  : state_name = "S0_FETCH";
            4'd1  : state_name = "S1_DECODE";
            4'd2  : state_name = "S2_MEMADR";
            4'd3  : state_name = "S3_MEMRD";
            4'd4  : state_name = "S4_MEMWB";
            4'd5  : state_name = "S5_MEMWR";
            4'd6  : state_name = "S6_EXEC";
            4'd7  : state_name = "S7_ALUWB";
            4'd8  : state_name = "S8_IMMEX";
            4'd9  : state_name = "S9_JAL";
            4'd10 : state_name = "S10_BRANCH";
            default : state_name = "UNKNOWN";
        endcase
    end
    endfunction

    logic [3:0] prev_state;
    integer instruction_count;

    initial begin
        prev_state = 0;
        instruction_count = 0;

        $display("\nMULTICYCLE RISC-V TRACE");
        $display("=========================================================================================================");
    end

    //--------------------------------------------------
    // Trace
    //--------------------------------------------------
    always @(posedge CLK) begin
    
        if(!rst) begin
    
            // Instruction completed when FSM returns to FETCH
            if (DUT.uutt5.state == 4'd0 &&
                prev_state      != 4'd0) begin
    
                instruction_count++;
    
                $display("");
                $display("================================================================================");
                $display(" Instruction %0d Completed", instruction_count);
                $display("================================================================================");
            end
    
            $display(
            "T=%0t | %-10s | PC=%0d | Instr=%08h | OldPC=%0d | Adr=%0d | Imm=%0d | Rs1=%0d | Rs2=%0d | Rd=%0d | Result=%0d | WriteData=%0d",
            $time,
            state_name(DUT.uutt5.state),
            DUT.PC,
            DUT.Instr,      // <-- remains hexadecimal
            DUT.OldPC,
            DUT.Adr,
            DUT.ImmExt,
            DUT.Rs1,
            DUT.Rs2,
            DUT.Rd,
            DUT.Result,
            DUT.WriteData
            );
    
            $display(
            "        RegWrite=%0d MemWrite=%0d",
            DUT.RegWrite,
            DUT.MemWrite
            );
    
            $display("--------------------------------------------------------------------------------");
        end
    
        
        prev_state <= DUT.uutt5.state;
    end

endmodule
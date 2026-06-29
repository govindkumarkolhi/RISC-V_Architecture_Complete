`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2026 01:47:46 AM
// Design Name: 
// Module Name: Top_tb
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



module Top_tb;

    logic clk;
    logic rst;
    integer cycle;

    Top dut (
        .clk (clk),
        .rst (rst)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst   = 1;
        cycle = 0;
        #50;
        rst = 0;
        #150;    
        $finish;
    end

    always @(posedge clk) //cycle counter to verify the results better
        if (rst) cycle <= 0;
        else     cycle <= cycle + 1;

   task automatic decode_instr; //instruction decoder 
        input  [31:0] instr;
        output [63:0] mnemonic;   // 8 ASCII chars packed
    begin
        case (instr[6:0])
            7'b0110011: begin   // R-type
                case ({instr[14:12], instr[30]})
                    4'b0000: mnemonic = "ADD     ";
                    4'b0001: mnemonic = "SUB     ";
                    4'b1110: mnemonic = " AND      ";
                    4'b1110+1: mnemonic = "OR     ";
                    default: mnemonic = "R-TYPE  ";
                endcase
            end
            7'b0010011: begin   // I-type ALU
                case (instr[14:12])
                    3'b000:  mnemonic = "ADDI    ";
                    3'b010:  mnemonic = "SLTI    ";
                    3'b110:  mnemonic = "ORI     ";
                    3'b111:  mnemonic = "ANDI    ";
                    default: mnemonic = "I-ALU   ";
                endcase
            end
            7'b0000011: mnemonic = "LW      ";
            7'b0100011: mnemonic = "SW      ";
            7'b1100011: mnemonic = "BEQ     ";
            7'b1101111: mnemonic = "JAL     ";
            7'b0000000: mnemonic = "NOP/--- ";
            default:    mnemonic = "UNKNOWN ";
        endcase
    end
    endtask



    // ---------------------------------------------------------------
    always @(posedge clk) begin : TRACE
        reg [63:0] mnem_f, mnem_d;

        if (!rst) begin

            decode_instr(dut.InstrD,                   mnem_f);
            decode_instr({dut.ImmExtE[11:0],            // rough reconstruct
                           dut.Rs2E, dut.Rs1E,
                           3'b000, dut.RdE, 7'b0010011}, mnem_d);

           // ==========================================================
                           // HEADER
                           // ==========================================================
                           $display("");
                           $display("======================================================================");
                           $display(" Cycle %-3d   Time = %-8t", cycle, $time);
                           $display("======================================================================");
                           
                           // FETCH
                           $display("[FETCH]");
                           $display("  PC        : 0x%08h", dut.PCD);
                           $display("  Instr     : 0x%08h   %-8s", dut.InstrD, mnem_f);
                           $display("  PC+4      : 0x%08h", dut.PCPlus4D);
                           $display("----------------------------------------------------------------------");
                           
                           // DECODE
                           $display("[DECODE]");
                           $display("  Rs1 (x%-2d): 0x%08h (%0d)", dut.Rs1E, dut.RD1E, dut.RD1E);
                           $display("  Rs2 (x%-2d): 0x%08h (%0d)", dut.Rs2E, dut.RD2E, dut.RD2E);
                           $display("  Rd  (x%-2d)", dut.RdE);
                           $display("  ImmExt    : 0x%08h (%0d)", dut.ImmExtE, $signed(dut.ImmExtE));
                           $display("----------------------------------------------------------------------");
                           
                           // EXECUTE
                           $display("[EXECUTE]");
                           $display("  ALUResult : 0x%08h (%0d)", dut.ALUResultM, dut.ALUResultM);
                           $display("  PCTarget  : 0x%08h", dut.PCTargetE);
                           
                           if (dut.PCSrcE)
                               $display("  PCSrc     : 1  << BRANCH/JUMP TAKEN >>");
                           else
                               $display("  PCSrc     : 0");
                           
                           $display("----------------------------------------------------------------------");
                           
                           // MEMORY
                           $display("[MEMORY]");
                           $display("  Address   : 0x%08h", dut.ALUResultM);
                           $display("  WriteData : 0x%08h (%0d)", dut.WriteDataM, dut.WriteDataM);
                           $display("  Rd (x%-2d): RegWrite=%0b  MemWrite=%0b",
                                    dut.RdM,
                                    dut.RegWriteM,
                                    dut.MemWriteM);
                           $display("----------------------------------------------------------------------");
                           
                           // WRITE BACK
                           $display("[WRITE BACK]");
                           $display("  Result    : 0x%08h (%0d)", dut.ResultW, dut.ResultW);
                           $display("  Rd (x%-2d): RegWrite=%0b",
                                    dut.RdW,
                                    dut.RegWriteW);
                           $display("----------------------------------------------------------------------");
                           
                           // HAZARD
                           $display("[HAZARD UNIT]");
                           $display("  ForwardAE : %02b", dut.ForwardAE);
                           $display("  ForwardBE : %02b", dut.ForwardBE);
                           $display("  StallF    : %0b", dut.StallF);
                           $display("  StallD    : %0b", dut.StallD);
                           $display("  FlushD    : %0b", dut.FlushD);
                           $display("  FlushE    : %0b", dut.FlushE);
                           $display("======================================================================");
        end
    end

    // ---------------------------------------------------------------
    // One-line monitor  (fires on any signal change — quick scan)
    // ---------------------------------------------------------------
    initial
        $monitor("T=%6t | cyc=%-2d | PC=%h | Instr=%h | ALUM=%h | ResultW=%h | x%0d",
                  $time, cycle,
                  dut.PCD, dut.InstrD,
                  dut.ALUResultM, dut.ResultW, dut.RdW);

    // ---------------------------------------------------------------
    // Final register-file dump after simulation ends
    // ---------------------------------------------------------------
    final begin
        integer i;
        $display("");
        $display("|------------------------------------------------------------------------------------|");
        $display("|         Register file final state        |");
        $display("|----------------------------------------------------------------------|----------|");
        $display("|  Reg   |    Hex value              | Dec |");
        $display("|----------------|------------------------------------------------------|----------|");
        for (i = 0; i < 32; i = i + 1) begin
            if (dut.decode.RegisterFile.reg_memory[i] !== 32'b0)
                $display("|  x%-2d   |  0x%08h               | %-5d |",
                          i, dut.decode.RegisterFile.reg_memory[i],
                          dut.decode.RegisterFile.reg_memory[i]);
        end
        $display("|----------------|------------------------------------------------------|----------|");
    end

endmodule
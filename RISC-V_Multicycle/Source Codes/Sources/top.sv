`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 04:21:48 PM
// Design Name: 
// Module Name: top
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


module top(
    input logic rst,
    input logic CLK
);


logic [31:0] ImmExt;

logic [31:0] ALUResult;
logic         Zero;

// wires for main decoder output
logic       RegWrite;
logic       ALUSrc;
logic       MemRead;
logic       Branch;
logic [2:0] ALUControl;
logic [1:0] ALUOp;

logic PCSrc;

logic PCWrite; //progrm counter write enable
logic [31:0] PCNext, PC;
logic AdrSrc; //First 2 to 1 Mux Select line 
logic [31:0] Adr; //First 2 to 1 MUX output 
logic [31:0] Result; //last 3 to 1 MUX output

//wires for Inst/Data Memory block
logic MemWrite; //memroy write enable signal 
logic [31:0] WriteData;
logic [31:0] ReadData;

logic PCUpdate;

//wires for OldPC register block
logic IRWrite; //write enable
logic [31:0] OldPC; 
logic [31:0] Instr;

logic [31:0] RD1, RD2;

logic [31:0] A; //Its Next of RD1 --> A <= RD1

logic [1:0] ALUSrcA, ALUSrcB, ResultSrc; //2 bit select lines for 3 Muxes
logic [31:0] SrcA, SrcB; //outputs of MUX1 and MUX2

logic [31:0] ALUOut; //

logic [31:0] Data; //reg4 output 


//Program Counter
program_counter reg1(
    .CLK(CLK),
    .EN(PCWrite),
    .rst(rst),
    .PCNext(Result),
    .PC(PC)
);


// First 2 to 1 MUX
mux_2_to_1 MUX1(
    .A(PC),
    .B(Result),
    .sel(AdrSrc),
    .out(Adr)
);

// Instruction/Data Memory Block 
instDataMem dataMem(
    .CLK(CLK),
    .WE(MemWrite),
    .A(Adr),
    .WD(WriteData),
    .RD(ReadData)
);



//second non architectural Register OldPC
OldPC_reg oldpc(
.CLK(CLK), 
.EN(IRWrite), 
.rst(rst),
.PC(PC), 
.ReadData(ReadData),  
.OldPC(OldPC), 
.Instr(Instr)
);


// Immediate Generator without using control unit 
imm_gen uut6(
    .instruction(Instr),
    .imm_out(ImmExt)
);

logic [4:0] Rs1, Rs2, Rd;
assign Rs1 = Instr[19:15];
assign Rs2 = Instr[24:20];
assign Rd = Instr[11:7];

// Register File
reg_file uut5(
    .A1(Instr[19:15]),
    .A2(Instr[24:20]),
    .A3(Instr[11:7]),
    .WD3(Result), //for data writing in register
    .RD1(RD1),
    .RD2(RD2),
    .WE3(RegWrite), //Register Write Enable pin
    .CLK(CLK),
    .rst(rst)
);






//Non Architectural Register after the REG File Block

RegFile_reg reg2(
.CLK(CLK),
.rst(rst),
.RD1(RD1),
.RD2(RD2),
.A(A),
.WriteData(WriteData)
);



// first 3 to 1 MUX with select line ALUSrcA[1:0]
mux_3_to_1 MUXSrcA(
.a(PC),
.b(OldPC),
.c(A),
.sel(ALUSrcA),
.out3(SrcA)
);


// second 3 to 1 MUX with select line ALUSrcB[1:0]
mux_3_to_1 MUXSrcB(
.a(WriteData),
.b(ImmExt),
.c(32'd4),
.sel(ALUSrcB),
.out3(SrcB)
);


//mux_3_to_1 mux1(
//.a(),
//.b(),
//.c(),
//.sel(),
//.out3()ReadData
//);

main_FSM uutt5(
.CLK(CLK),
.rst(rst),
.op(Instr[6:0]),
.Branch(Branch),
.PCUpdate(PCUpdate),
.RegWrite(RegWrite),
.MemWrite(MemWrite),
.IRWrite(IRWrite),  
.ResultSrc(ResultSrc),
.ALUSrcA(ALUSrcA),
.ALUSrcB(ALUSrcB),
.AdrSrc(AdrSrc),
.ALUOp(ALUOp)
);


ALU_Control ALUcontrol(
.ALUOp(ALUOp),
.func3(Instr[14:12]),
.func7_5(Instr[30]),
.op5(Instr[5]),
.ALUControl(ALUControl)

);




// ALU
ALU ALU1(
    .in1(SrcA),
    .in2(SrcB),
    .alu_control(ALUControl), 
    .result(ALUResult),
    .zero_flag(Zero)
);
 
assign PCWrite = PCUpdate | (Branch & Zero);

//non Architectural Register after ALU Block

Reg_ALU reg3(
.CLK(CLK),
.rst(rst),
.ALUResult(ALUResult),
.ALUOut(ALUOut)

);

//non Architectural Register after Inst/Data Memory Block
Reg_ALU reg4(
.CLK(CLK),
.rst(rst),
.ALUResult(ReadData),
.ALUOut(Data)

);


mux_3_to_1 MUXResult(
.a(ALUOut),
.b(Data),
.c(ALUResult),
.sel(ResultSrc),
.out3(Result)
);

endmodule
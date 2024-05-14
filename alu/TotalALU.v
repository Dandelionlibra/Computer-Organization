`timescale 1ns/1ns
module TotalALU( clk, dataA, dataB, Signal, Output, reset );
input reset ;
input clk ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] Output ;

wire [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SLL = 6'b000010;

parameter MULTU= 6'b011001;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;


wire [5:0]  SignaltoALU ;
wire [5:0]  SignaltoSHT ;
wire [5:0]  SignaltoMULTU ;
wire [5:0]  SignaltoMUX ;
wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
wire [31:0] dataOut ;
wire [63:0] DivAns ;

ALUControl ALUControl( .clk(clk), .Signal(Signal), .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoMULTU(SignaltoMULTU), .SignaltoMUX(SignaltoMUX) );
ALU ALU( .dataA(dataA), .dataB(dataB), .Signal(SignaltoALU), .dataOut(ALUOut), .reset(reset) );
Multiplier Multiplier( .clk(clk), .dataA(dataA), .dataB(dataB), .Signal(SignaltoMULTU), .dataOut(DivAns), .reset(reset) );
Shifter Shifter( .dataA(dataA), .dataB(dataB), .Signal(SignaltoSHT), .dataOut(ShifterOut), .reset(reset) );
HiLo HiLo( .clk(clk), .DivAns(DivAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
MUX MUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX), .dataOut(dataOut) );


assign Output = dataOut ;


endmodule
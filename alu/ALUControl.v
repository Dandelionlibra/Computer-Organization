`timescale 1ns/1ns
module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX );
input clk ;
input [5:0] Signal ;
output [5:0] SignaltoALU ;
output [5:0] SignaltoSHT ;
output [5:0] SignaltoMULTU ;
output [5:0] SignaltoMUX ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42
//   SLL  : 00
//   MULTU: 25


reg [5:0] temp ;
reg [6:0] counter ;


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SLL = 6'b000000;
parameter MULTU= 6'b011001;

always@( Signal )
begin
  if ( Signal == MULTU )
  begin
    counter = 0 ;
  end

end

always@( posedge clk )
begin
  temp = Signal ;
  if ( Signal == MULTU )
  begin
    counter = counter + 1 ;
    if ( counter == 32 )
    begin
      temp = 6'b111111 ; // Open HiLo reg for Mul
      counter = 0 ;
    end
  end

end


assign SignaltoALU = temp ;
assign SignaltoSHT = temp ;
assign SignaltoMULTU = temp ;
assign SignaltoMUX = temp ;


endmodule
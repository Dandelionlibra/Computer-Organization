// 設定時間尺度
`timescale 1ns/1ns
// 定義 module MUX 可連接的 ports
module MUX( ALUOut, HiOut, LoOut, Shifter, Signal, dataOut );
// 定義哪些 ports 為 input，哪些為 output
input [31:0] ALUOut ;
input [31:0] HiOut ;
input [31:0] LoOut ;
input [31:0] Shifter ;
input [5:0] Signal ;
output [31:0] dataOut ;

reg [31:0] temp ;
// 定義各種參數常數(可提高可讀性)
parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SLL = 6'b000000;

parameter MULTU= 6'b011001;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;

// 若訊號為 AND, OR, ADD, SUB, 或 SLT，則將 dataOut 設為 ALU 的輸出
// 否則若為乘法運算取高位，則將 dataOut 設為 Hi 的值
// 否則若為乘法運算取低位，則將 dataOut 設為 Lo 的值
// 否則若為左移運算，則將 dataOut 設為 Shifter 的結果
// 否則設為 0
assign dataOut = (Signal == AND || Signal == OR || Signal == ADD || Signal == SUB || Signal == SLT ) ? 
ALUOut
:(Signal == MFHI) ? 
HiOut
: (Signal == MFLO) ? 
LoOut
: (Signal == SLL) ? 
Shifter : 32'b0;

endmodule
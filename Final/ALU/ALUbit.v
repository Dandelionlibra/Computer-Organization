// 設定時間尺度
`timescale 1ns/1ns
// 定義 module ALUbit 可連接的 ports
module ALUbit( a, b, bitInvert, cin, less, operation, dataOut, set, cout );
// 1 bit ALU
// 定義哪些 ports 為 input，哪些為 output
input a, b, bitInvert, cin, less ;
input [5:0] operation ;
output dataOut, set, cout;

// 定義 wire 以連接每個 module
wire cin;
wire andOut, orOut, xorOut;

// 分別對 a, b 進行 AND, OR 運算
and(andOut, a, b);
or(orOut, a, b);
// 將 b 與 bitInvert 運算，若 bitInvert 為 1，則會將 b 進行 invert( 1 變 0，0 變 1 )
xor(xorOut, bitInvert, b);
// 把 a 與處理過的 b 給加法器運算
FullAdder U_FA( .a(a), .b(xorOut), .cin(cin), .sum(set), .cout(cout) );
// 多工器以 operation 判斷要哪個運算的結果
ALU_MUX4_1 U_Mux4_1( .out(dataOut), .in0(andOut), .in1(orOut), .in2(set), .in3(less), .sel(operation) );

endmodule

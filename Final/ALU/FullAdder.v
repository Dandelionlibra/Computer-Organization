// 設定時間尺度
`timescale 1ns/1ns
// 定義 module FullAdder 可連接的 ports
module FullAdder( a, b, cin, sum, cout );
// 定義哪些 ports 為 input，哪些為 output
input a, b, cin;
output sum, cout;
// 根據加法器運算，sum 為 a XOR b XOR cin
assign sum = a ^ b ^ cin;
// cout 為 ( a AND b ) OR ( ( A XOR B ) AND cin )
assign cout = (a & b) | ((a ^ b) & cin);

endmodule
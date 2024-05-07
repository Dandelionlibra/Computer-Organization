`timescale 1ns/1ns

module FullAdder( a, b, cin, sum, cout );
input a, b, cin;
output sum, cout;

assign sum = a ^ b ^ cin;
assign cout = (a & b) | ((a ^ b) & cin);

endmodule
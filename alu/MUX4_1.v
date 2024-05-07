module MUX4_1(out, in3, in2, in1, in0, sel);

output	out;
input	in3, in2, in1, in0;
input	[5:0]sel;

wire	out;

// Continuous assigment
assign	out = (sel==6'b100100) ? in0 : (sel==6'b100101) ? in1 : (sel==6'b100000 || sel==6'b100010) ? in2 : in3;

endmodule
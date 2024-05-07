`timescale 1ns/1ns

module Mux4_1 (out, in0, in1, in2, in3, sel);
    output out;
    input in0, in1, in2, in3;
    input [5:0] sel;
    
    assign out = (sel == 6'd36) ? in0 : 
                 (sel == 6'd37) ? in1 : 
                 (sel == 6'd32 || sel == 6'd34) ? in2 : in3;

endmodule
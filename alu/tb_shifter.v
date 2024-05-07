`timescale 1ns/1ns

module tb_shifter;

reg [31:0] a, b;
reg [5:0] signal;
reg [31:0] dataOut;
reg set;

Shifter U_Shifter( .a(a), .b(b), .signal(signal), .dataOut(dataOut), .set(set) );


parameter t = 100;
initial begin

    // Test case 1
    a = 32'd12;
    b = 32'd2;
    signal = 6'b000010;

    #t;
    $stop;


end

endmodule
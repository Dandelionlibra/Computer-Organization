library verilog;
use verilog.vl_types.all;
entity ALU_MUX4_1 is
    port(
        \out\           : out    vl_logic;
        in3             : in     vl_logic;
        in2             : in     vl_logic;
        in1             : in     vl_logic;
        in0             : in     vl_logic;
        sel             : in     vl_logic_vector(2 downto 0)
    );
end ALU_MUX4_1;

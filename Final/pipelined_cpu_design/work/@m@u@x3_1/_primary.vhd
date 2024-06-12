library verilog;
use verilog.vl_types.all;
entity MUX3_1 is
    generic(
        bitwidth        : integer := 32
    );
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        c               : in     vl_logic_vector;
        y               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
end MUX3_1;

library verilog;
use verilog.vl_types.all;
entity BEQ is
    generic(
        BEQ             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0)
    );
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        zero            : out    vl_logic;
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BEQ : constant is 1;
end BEQ;

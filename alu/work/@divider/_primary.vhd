library verilog;
use verilog.vl_types.all;
entity Divider is
    generic(
        DIVU            : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi1, Hi0, Hi1, Hi1);
        \OUT\           : vl_logic_vector(0 to 5) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        dataA           : in     vl_logic_vector(31 downto 0);
        dataB           : in     vl_logic_vector(31 downto 0);
        \Signal\        : in     vl_logic_vector(5 downto 0);
        dataOut         : out    vl_logic_vector(63 downto 0);
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DIVU : constant is 1;
    attribute mti_svvh_generic_type of \OUT\ : constant is 1;
end Divider;

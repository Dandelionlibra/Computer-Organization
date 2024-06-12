library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        nextPC_IF       : in     vl_logic_vector(31 downto 0);
        RD_IF           : in     vl_logic_vector(31 downto 0);
        nextPC_ID       : out    vl_logic_vector(31 downto 0);
        RD_ID           : out    vl_logic_vector(31 downto 0)
    );
end IF_ID;

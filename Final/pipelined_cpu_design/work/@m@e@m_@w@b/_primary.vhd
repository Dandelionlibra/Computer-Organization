library verilog;
use verilog.vl_types.all;
entity MEM_WB is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        WB_MEM          : in     vl_logic_vector(1 downto 0);
        WB_WB           : out    vl_logic_vector(1 downto 0);
        ALUOut_MEM      : in     vl_logic_vector(31 downto 0);
        ALUOut_WB       : out    vl_logic_vector(31 downto 0);
        DataMEM_RD_MEM  : in     vl_logic_vector(31 downto 0);
        DataMEM_RD_WB   : out    vl_logic_vector(31 downto 0);
        WN_MEM          : in     vl_logic_vector(4 downto 0);
        WN_WB           : out    vl_logic_vector(4 downto 0)
    );
end MEM_WB;

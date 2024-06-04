library verilog;
use verilog.vl_types.all;
entity EX_MEM is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        WB_EX           : in     vl_logic_vector(1 downto 0);
        MEM_EX          : in     vl_logic_vector(2 downto 0);
        WB_MEM          : out    vl_logic_vector(1 downto 0);
        MEM_MEM         : out    vl_logic_vector(2 downto 0);
        WN_EX           : in     vl_logic_vector(4 downto 0);
        WN_MEM          : out    vl_logic_vector(4 downto 0);
        RD2_WD_EX       : in     vl_logic_vector(31 downto 0);
        RD2_WD_MEM      : out    vl_logic_vector(31 downto 0);
        ALUOut_EX       : in     vl_logic_vector(31 downto 0);
        ALUOut_MEM      : out    vl_logic_vector(31 downto 0)
    );
end EX_MEM;

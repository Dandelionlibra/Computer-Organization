library verilog;
use verilog.vl_types.all;
entity ID_EX is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RT_ID           : in     vl_logic_vector(4 downto 0);
        RT_EX           : out    vl_logic_vector(4 downto 0);
        RD_ID           : in     vl_logic_vector(4 downto 0);
        RD_EX           : out    vl_logic_vector(4 downto 0);
        RD1_ID          : in     vl_logic_vector(31 downto 0);
        RD1_EX          : out    vl_logic_vector(31 downto 0);
        RD2_ID          : in     vl_logic_vector(31 downto 0);
        RD2_EX          : out    vl_logic_vector(31 downto 0);
        imm_ID          : in     vl_logic_vector(31 downto 0);
        imm_EX          : out    vl_logic_vector(31 downto 0);
        WB_ID           : in     vl_logic_vector(1 downto 0);
        WB_EX           : out    vl_logic_vector(1 downto 0);
        EX_ID           : in     vl_logic_vector(3 downto 0);
        EX_EX           : out    vl_logic_vector(3 downto 0);
        MEM_ID          : in     vl_logic_vector(2 downto 0);
        MEM_EX          : out    vl_logic_vector(2 downto 0);
        func_ID         : in     vl_logic_vector(5 downto 0);
        func_EX         : out    vl_logic_vector(5 downto 0);
        shamt_ID        : in     vl_logic_vector(4 downto 0);
        shamt_EX        : out    vl_logic_vector(4 downto 0)
    );
end ID_EX;

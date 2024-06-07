library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    generic(
        R_TYPE          : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        NOP             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        ANDI            : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi0);
        LW              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi1);
        SW              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi1);
        BEQ             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        J               : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        Funct_JR        : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        Funct_MULTU     : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi1, Hi0, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        OpCode          : in     vl_logic_vector(5 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        EX              : out    vl_logic_vector(3 downto 0);
        MEM             : out    vl_logic_vector(2 downto 0);
        WB              : out    vl_logic_vector(1 downto 0);
        ExtendSel       : out    vl_logic;
        Jump            : out    vl_logic;
        JR              : out    vl_logic;
        rst             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of R_TYPE : constant is 1;
    attribute mti_svvh_generic_type of NOP : constant is 1;
    attribute mti_svvh_generic_type of ANDI : constant is 1;
    attribute mti_svvh_generic_type of LW : constant is 1;
    attribute mti_svvh_generic_type of SW : constant is 1;
    attribute mti_svvh_generic_type of BEQ : constant is 1;
    attribute mti_svvh_generic_type of J : constant is 1;
    attribute mti_svvh_generic_type of Funct_JR : constant is 1;
    attribute mti_svvh_generic_type of Funct_MULTU : constant is 1;
end ControlUnit;

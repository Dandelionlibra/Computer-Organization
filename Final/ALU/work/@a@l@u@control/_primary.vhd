library verilog;
use verilog.vl_types.all;
entity ALUControl is
    generic(
        ALU_AND         : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        ALU_OR          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        ALU_ADD         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        ALU_SUB         : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        ALU_SLT         : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1);
        ALU_SLL         : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        ALU_OpenHiLo    : vl_logic_vector(0 to 5) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi1);
        Funct_SLL       : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        Funct_ADD       : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        Funct_SUB       : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi0);
        Funct_AND       : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi0);
        Funct_OR        : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi1);
        Funct_SLT       : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi0);
        Funct_MULTU     : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi1, Hi0, Hi0, Hi1);
        Funct_MFHI      : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        Funct_MFLO      : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi0, Hi0, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        ALUOp           : in     vl_logic_vector(1 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        ALUOperation    : out    vl_logic_vector(2 downto 0);
        SignaltoMULTU   : out    vl_logic_vector(5 downto 0);
        SelHilo         : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ALU_AND : constant is 1;
    attribute mti_svvh_generic_type of ALU_OR : constant is 1;
    attribute mti_svvh_generic_type of ALU_ADD : constant is 1;
    attribute mti_svvh_generic_type of ALU_SUB : constant is 1;
    attribute mti_svvh_generic_type of ALU_SLT : constant is 1;
    attribute mti_svvh_generic_type of ALU_SLL : constant is 1;
    attribute mti_svvh_generic_type of ALU_OpenHiLo : constant is 1;
    attribute mti_svvh_generic_type of Funct_SLL : constant is 1;
    attribute mti_svvh_generic_type of Funct_ADD : constant is 1;
    attribute mti_svvh_generic_type of Funct_SUB : constant is 1;
    attribute mti_svvh_generic_type of Funct_AND : constant is 1;
    attribute mti_svvh_generic_type of Funct_OR : constant is 1;
    attribute mti_svvh_generic_type of Funct_SLT : constant is 1;
    attribute mti_svvh_generic_type of Funct_MULTU : constant is 1;
    attribute mti_svvh_generic_type of Funct_MFHI : constant is 1;
    attribute mti_svvh_generic_type of Funct_MFLO : constant is 1;
end ALUControl;

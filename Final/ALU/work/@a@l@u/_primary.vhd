library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        ALU_AND         : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        ALU_OR          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        ALU_ADD         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        ALU_SUB         : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        ALU_SLT         : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1);
        ALU_SLL         : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        ALU_OpenHiLo    : vl_logic_vector(0 to 5) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi1)
    );
    port(
        dataA           : in     vl_logic_vector(31 downto 0);
        dataB           : in     vl_logic_vector(31 downto 0);
        control         : in     vl_logic_vector(2 downto 0);
        dataOut         : out    vl_logic_vector(31 downto 0);
        shamt           : in     vl_logic_vector(4 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ALU_AND : constant is 1;
    attribute mti_svvh_generic_type of ALU_OR : constant is 1;
    attribute mti_svvh_generic_type of ALU_ADD : constant is 1;
    attribute mti_svvh_generic_type of ALU_SUB : constant is 1;
    attribute mti_svvh_generic_type of ALU_SLT : constant is 1;
    attribute mti_svvh_generic_type of ALU_SLL : constant is 1;
    attribute mti_svvh_generic_type of ALU_OpenHiLo : constant is 1;
end ALU;

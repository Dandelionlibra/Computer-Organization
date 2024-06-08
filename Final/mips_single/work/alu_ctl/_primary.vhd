library verilog;
use verilog.vl_types.all;
entity alu_ctl is
    generic(
        F_add           : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        F_sub           : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi0);
        F_and           : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi0);
        F_or            : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi1);
        F_slt           : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi0);
        ALU_add         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        ALU_sub         : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        ALU_and         : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        ALU_or          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        ALU_slt         : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        ALUOperation    : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of F_add : constant is 1;
    attribute mti_svvh_generic_type of F_sub : constant is 1;
    attribute mti_svvh_generic_type of F_and : constant is 1;
    attribute mti_svvh_generic_type of F_or : constant is 1;
    attribute mti_svvh_generic_type of F_slt : constant is 1;
    attribute mti_svvh_generic_type of ALU_add : constant is 1;
    attribute mti_svvh_generic_type of ALU_sub : constant is 1;
    attribute mti_svvh_generic_type of ALU_and : constant is 1;
    attribute mti_svvh_generic_type of ALU_or : constant is 1;
    attribute mti_svvh_generic_type of ALU_slt : constant is 1;
end alu_ctl;

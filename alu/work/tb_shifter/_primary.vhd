library verilog;
use verilog.vl_types.all;
entity tb_shifter is
    generic(
        t               : integer := 100
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of t : constant is 1;
end tb_shifter;

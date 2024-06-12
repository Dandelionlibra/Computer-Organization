library verilog;
use verilog.vl_types.all;
entity unsign_extend is
    port(
        immed_in        : in     vl_logic_vector(15 downto 0);
        ext_immed_out   : out    vl_logic_vector(31 downto 0)
    );
end unsign_extend;

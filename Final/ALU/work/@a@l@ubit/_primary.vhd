library verilog;
use verilog.vl_types.all;
entity ALUbit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        bitInvert       : in     vl_logic;
        cin             : in     vl_logic;
        less            : in     vl_logic;
        operation       : in     vl_logic_vector(2 downto 0);
        dataOut         : out    vl_logic;
        set             : out    vl_logic;
        cout            : out    vl_logic
    );
end ALUbit;

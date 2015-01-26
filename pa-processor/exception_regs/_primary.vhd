library verilog;
use verilog.vl_types.all;
entity exception_regs is
    port(
        clk             : in     vl_logic;
        \iF\            : in     vl_logic;
        iD              : in     vl_logic;
        iEX             : in     vl_logic;
        iTL             : in     vl_logic;
        iC              : in     vl_logic;
        iWB             : in     vl_logic;
        iS1             : in     vl_logic;
        iS2             : in     vl_logic;
        iS3             : in     vl_logic;
        iS4             : in     vl_logic;
        iS5             : in     vl_logic;
        \oF\            : out    vl_logic;
        oD              : out    vl_logic;
        oEX             : out    vl_logic;
        oTL             : out    vl_logic;
        oC              : out    vl_logic;
        oWB             : out    vl_logic;
        oS1             : out    vl_logic;
        oS2             : out    vl_logic;
        oS3             : out    vl_logic;
        oS4             : out    vl_logic;
        oS5             : out    vl_logic
    );
end exception_regs;

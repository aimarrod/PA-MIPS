library verilog;
use verilog.vl_types.all;
entity exceptions is
    port(
        clk             : in     vl_logic;
        dmiss           : in     vl_logic;
        imiss           : in     vl_logic;
        dfill           : in     vl_logic;
        ifill           : in     vl_logic;
        jump            : in     vl_logic;
        remaining_stores: in     vl_logic;
        IFID_we         : out    vl_logic;
        IDEX_we         : out    vl_logic;
        EX_WBTL_we      : out    vl_logic;
        TLC_we          : out    vl_logic;
        CWB_we          : out    vl_logic;
        EXS1_we         : out    vl_logic;
        S12_we          : out    vl_logic;
        S23_we          : out    vl_logic;
        S34_we          : out    vl_logic;
        IFID_reset      : out    vl_logic;
        IDEX_reset      : out    vl_logic;
        EX_WBTL_reset   : out    vl_logic;
        TLC_reset       : out    vl_logic;
        CWB_reset       : out    vl_logic;
        EXS1_reset      : out    vl_logic;
        S12_reset       : out    vl_logic;
        S23_reset       : out    vl_logic;
        S34_reset       : out    vl_logic;
        pc_we           : out    vl_logic
    );
end exceptions;

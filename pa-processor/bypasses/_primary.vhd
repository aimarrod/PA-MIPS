library verilog;
use verilog.vl_types.all;
entity bypasses is
    port(
        rs_D            : in     vl_logic_vector(4 downto 0);
        rt_D            : in     vl_logic_vector(4 downto 0);
        rd_EX           : in     vl_logic_vector(4 downto 0);
        rd_TL           : in     vl_logic_vector(4 downto 0);
        rd_C            : in     vl_logic_vector(4 downto 0);
        rd_WB           : in     vl_logic_vector(4 downto 0);
        rob_rd_0        : in     vl_logic_vector(4 downto 0);
        rob_rd_1        : in     vl_logic_vector(4 downto 0);
        rob_rd_2        : in     vl_logic_vector(4 downto 0);
        rob_rd_3        : in     vl_logic_vector(4 downto 0);
        rob_rd_4        : in     vl_logic_vector(4 downto 0);
        rob_rd_5        : in     vl_logic_vector(4 downto 0);
        rob_rd_6        : in     vl_logic_vector(4 downto 0);
        rob_rd_7        : in     vl_logic_vector(4 downto 0);
        rob_valids      : in     vl_logic_vector(7 downto 0);
        rs_from_EX      : out    vl_logic;
        rs_from_TL      : out    vl_logic;
        rs_from_WB      : out    vl_logic;
        rs_from_C       : out    vl_logic;
        rt_from_EX      : out    vl_logic;
        rt_from_TL      : out    vl_logic;
        rt_from_WB      : out    vl_logic;
        rt_from_C       : out    vl_logic;
        ROB_tail        : in     vl_logic_vector(2 downto 0);
        rt_from_ROB     : out    vl_logic_vector(2 downto 0);
        rs_ROB          : out    vl_logic;
        rs_from_ROB     : out    vl_logic_vector(2 downto 0);
        rt_ROB          : out    vl_logic
    );
end bypasses;

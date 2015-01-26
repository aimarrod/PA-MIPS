library verilog;
use verilog.vl_types.all;
entity TL_C is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        reset           : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0);
        addr_in         : in     vl_logic_vector(31 downto 0);
        addr_out        : out    vl_logic_vector(31 downto 0);
        val_in          : in     vl_logic_vector(31 downto 0);
        val_out         : out    vl_logic_vector(31 downto 0);
        rd_in           : in     vl_logic_vector(4 downto 0);
        rd_out          : out    vl_logic_vector(4 downto 0);
        mem_write_in    : in     vl_logic;
        mem_write_out   : out    vl_logic;
        word_in         : in     vl_logic;
        word_out        : out    vl_logic;
        mem_reg_write_in: in     vl_logic;
        mem_reg_write_out: out    vl_logic;
        rob_index_in    : in     vl_logic_vector(2 downto 0);
        rob_index_out   : out    vl_logic_vector(2 downto 0)
    );
end TL_C;

library verilog;
use verilog.vl_types.all;
entity EX_WBTL is
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        reset           : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0);
        alu_result_in   : in     vl_logic_vector(31 downto 0);
        alu_result_out  : out    vl_logic_vector(31 downto 0);
        rd_in           : in     vl_logic_vector(4 downto 0);
        rd_out          : out    vl_logic_vector(4 downto 0);
        rs_in           : in     vl_logic_vector(4 downto 0);
        rs_out          : out    vl_logic_vector(4 downto 0);
        rs_data_in      : in     vl_logic_vector(31 downto 0);
        rs_data_out     : out    vl_logic_vector(31 downto 0);
        mem_write_in    : in     vl_logic;
        alu_reg_write_in: in     vl_logic;
        mem_reg_write_in: in     vl_logic;
        mem_write_out   : out    vl_logic;
        alu_reg_write_out: out    vl_logic;
        mem_reg_write_out: out    vl_logic;
        word_in         : in     vl_logic;
        word_out        : out    vl_logic;
        branch_in       : in     vl_logic;
        branch_out      : in     vl_logic;
        rob_index_in    : in     vl_logic_vector(2 downto 0);
        rob_index_out   : out    vl_logic_vector(2 downto 0)
    );
end EX_WBTL;

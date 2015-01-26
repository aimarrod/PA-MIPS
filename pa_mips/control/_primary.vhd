library verilog;
use verilog.vl_types.all;
entity control is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        mem_write       : out    vl_logic;
        alu_src         : out    vl_logic;
        alu_reg_write   : out    vl_logic;
        mem_reg_write   : out    vl_logic;
        long_write      : out    vl_logic;
        branch          : out    vl_logic
    );
end control;

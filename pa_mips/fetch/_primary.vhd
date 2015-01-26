library verilog;
use verilog.vl_types.all;
entity fetch is
    port(
        clk             : in     vl_logic;
        branch_result   : in     vl_logic_vector(31 downto 0);
        branch          : in     vl_logic;
        pc_write        : in     vl_logic;
        fill            : in     vl_logic;
        fill_idx        : in     vl_logic_vector(4 downto 0);
        stream          : in     vl_logic_vector(63 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        miss            : out    vl_logic;
        pc_out          : out    vl_logic_vector(31 downto 0)
    );
end fetch;

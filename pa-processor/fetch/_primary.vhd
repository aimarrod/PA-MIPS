library verilog;
use verilog.vl_types.all;
entity fetch is
    port(
        clk             : in     vl_logic;
        branch_address  : in     vl_logic_vector(20 downto 0);
        branch          : in     vl_logic;
        pc_write        : in     vl_logic;
        fill            : in     vl_logic;
        stream          : in     vl_logic_vector(63 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        miss            : out    vl_logic;
        pc_out          : out    vl_logic_vector(31 downto 0);
        tlbmiss         : out    vl_logic
    );
end fetch;

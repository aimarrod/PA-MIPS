library verilog;
use verilog.vl_types.all;
entity icache is
    port(
        clk             : in     vl_logic;
        data_mem        : in     vl_logic_vector(63 downto 0);
        idx             : in     vl_logic_vector(4 downto 0);
        idb             : in     vl_logic_vector(2 downto 0);
        fill            : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end icache;

library verilog;
use verilog.vl_types.all;
entity dtags is
    port(
        clk             : in     vl_logic;
        tag             : in     vl_logic_vector(23 downto 0);
        idx             : in     vl_logic_vector(4 downto 0);
        fill            : in     vl_logic;
        miss            : out    vl_logic;
        dirty           : out    vl_logic
    );
end dtags;

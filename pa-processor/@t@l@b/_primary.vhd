library verilog;
use verilog.vl_types.all;
entity TLB is
    port(
        clk             : in     vl_logic;
        virtual         : in     vl_logic_vector(21 downto 0);
        physical        : out    vl_logic_vector(21 downto 0);
        exception       : out    vl_logic
    );
end TLB;

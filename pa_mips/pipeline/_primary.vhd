library verilog;
use verilog.vl_types.all;
entity pipeline is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end pipeline;

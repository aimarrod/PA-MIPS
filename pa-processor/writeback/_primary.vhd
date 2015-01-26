library verilog;
use verilog.vl_types.all;
entity writeback is
    port(
        result          : in     vl_logic_vector(31 downto 0);
        write           : in     vl_logic
    );
end writeback;

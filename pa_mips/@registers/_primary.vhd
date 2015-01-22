library verilog;
use verilog.vl_types.all;
entity Registers is
    port(
        clk             : in     vl_logic;
        writeFlag       : in     vl_logic;
        inData          : in     vl_logic_vector(31 downto 0);
        regWrt          : in     vl_logic_vector(31 downto 0);
        read1           : in     vl_logic_vector(31 downto 0);
        read2           : in     vl_logic_vector(31 downto 0);
        data1           : out    vl_logic_vector(31 downto 0);
        data2           : out    vl_logic_vector(31 downto 0)
    );
end Registers;

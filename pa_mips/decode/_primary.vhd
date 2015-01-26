library verilog;
use verilog.vl_types.all;
entity decode is
    port(
        inst            : in     vl_logic_vector(31 downto 0);
        mem_write       : out    vl_logic;
        alu_src         : out    vl_logic;
        alu_reg_write   : out    vl_logic;
        mem_reg_write   : out    vl_logic;
        long_write      : out    vl_logic;
        branch          : out    vl_logic;
        rs              : out    vl_logic_vector(4 downto 0);
        rt              : out    vl_logic_vector(4 downto 0);
        rd              : out    vl_logic_vector(4 downto 0);
        imm             : out    vl_logic_vector(31 downto 0);
        aluop           : out    vl_logic_vector(11 downto 0)
    );
end decode;

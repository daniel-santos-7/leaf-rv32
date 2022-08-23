library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package sim_pkg is
    
    component syscon is
        generic (
            CLK_PERIOD : time := 20 ns
        );
        port (
            halt_i : in  std_logic;
            clk_o  : out std_logic;
            rst_o  : out std_logic
        );
    end component syscon;

    component addr_comp is
        port (
            addr  : in  std_logic_vector(31 downto 0);
            acmp0 : out std_logic;
            acmp1 : out std_logic;
            acmp2 : out std_logic
        );
    end component addr_comp;

    component halt_gen is
        port (
            clk_i  : in  std_logic;
            rst_i  : in  std_logic;
            dat_i  : in  std_logic_vector(31 downto 0);
            cyc_i  : in  std_logic;
            stb_i  : in  std_logic;
            we_i   : in  std_logic;
            ack_o  : out std_logic;
            halt_o : out std_logic
        );
    end component halt_gen;

    component sim_out is
        port (
            halt_i: in  std_logic;
            clk_i : in  std_logic;
            rst_i : in  std_logic;
            dat_i : in  std_logic_vector(31 downto 0);
            cyc_i : in  std_logic;
            stb_i : in  std_logic;
            we_i  : in  std_logic;
            sel_i : in  std_logic_vector(3  downto 0);        
            ack_o : out std_logic
        );
    end component sim_out;

    component sim_mem is
        generic (
            BITS    : natural := 8;
            PROGRAM : string
        );
        port (
            clk_i : in  std_logic;
            rst_i : in  std_logic;
            dat_i : in  std_logic_vector(31 downto 0);
            cyc_i : in  std_logic;
            stb_i : in  std_logic;
            we_i  : in  std_logic;
            sel_i : in  std_logic_vector(3  downto 0);        
            adr_i : in  std_logic_vector(BITS-3 downto 0);
            ack_o : out std_logic;
            dat_o : out std_logic_vector(31 downto 0)
        );
    end component sim_mem;
    
end package sim_pkg;
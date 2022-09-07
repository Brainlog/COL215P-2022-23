library ieee;
use ieee.std_logic_1164.all;

entity ram_test is
end ram_test;

architecture ramtest of ram_test is
  component ram is
  port(
        din : in  std_logic_vector(7 downto 0);
        address_ram : in std_logic_vector(14 downto 0);
        dout : out std_logic_vector(7 downto 0);
        clk: in std_logic;
        re : in std_logic;
        we : in std_logic);     
  end component;
  
  signal clk: std_logic:= '1';
  signal address_ram : std_logic_vector(14 downto 0) := "000000000000010";
  signal re : std_logic := '1';
  signal we : std_logic := '1';
  signal dout : std_logic_vector(7 downto 0) := "00000000";
  signal din : std_logic_vector(7 downto 0) := "11111111";
  
begin
  
  DUT: ram port map (din, address_ram, dout, clk, re, we);
  process
  begin
--   wait for 10 ns;
    wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
    wait for 1 ns;
    clk <= '0';
   
    
    
    wait;
  end process;
end ramtest;
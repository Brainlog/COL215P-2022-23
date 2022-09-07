library ieee;
use ieee.std_logic_1164.all;

entity rom_test is
end rom_test;

architecture rtest of rom_test is
  component rom is
  	port(
    
        address_rom : in std_logic_vector(17 downto 0);
        dout_rom : out std_logic_vector(7 downto 0);
        clk: in std_logic;
        re : in std_logic

        ); 
   
  end component;
  
  signal clk: std_logic:= '0';
  signal address_rom : std_logic_vector(17 downto 0) := "000000000000000010";
  signal re : std_logic := '1';
  signal dout_rom : std_logic_vector(7 downto 0) := "00000000";
  
begin
  
  DUT: rom port map (address_rom, dout_rom, clk, re);
  process
  begin
--   wait for 10 ns;
    wait for 1 ns;
    clk <= '1';
    wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
    wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
    wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
     wait for 1 ns;
    clk <= '0';
    wait for 1 ns;
    clk <= '1';
    
    wait;
  end process;
end rtest;
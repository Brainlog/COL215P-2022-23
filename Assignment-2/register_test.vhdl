library ieee;
use ieee.std_logic_1164.all;

entity register_test is
end register_test;

architecture regtest of register_test is
  component register_a is
    port(
    
        din : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(7 downto 0);
        clk: in std_logic;
        re : in std_logic;
        we : in std_logic);     
  end component;
  
  signal clk: std_logic:= '0';
  signal re: std_logic:= '1';
  signal we: std_logic:= '1';
  signal din: std_logic_vector(7 downto 0):= "00000011";
  signal dout: std_logic_vector(7 downto 0);
  
begin
  
  DUT: register_a port map (din, dout, clk, re, we);
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
end regtest;
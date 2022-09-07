library ieee;
use ieee.std_logic_1164.all;

entity mac_test is
end mac_test;

architecture mct of mac_test is
  component mac is
    port (din1,din2: in std_logic_vector(7 downto 0);
          clk: in std_logic;
          cntrl : in std_logic;
            dout: out std_logic_vector(7 downto 0));
  end component;
  
  signal clk: std_logic:= '0';
  signal din1,din2 : std_logic_vector(7 downto 0) := "00000010";
  signal cntrl : std_logic := '1';
  signal dout : std_logic_vector(7 downto 0);
  
begin
  
  DUT: mac port map (din1, din2, clk, cntrl, dout);
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
    
    wait;
  end process;
end mct;
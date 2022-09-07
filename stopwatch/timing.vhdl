library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
  port (clk: in std_logic;
        sel: out std_logic_vector(1 downto 0));
end timer;

architecture timing of timer is
  signal state: unsigned(18 downto 0):= "0000000000000000000";
  constant one: unsigned(18 downto 0):= "0000000000000000001";
begin
  sel <= std_logic_vector(state(18 downto 17));
  process (clk)
  begin
    if (rising_edge(clk)) then
      state <= state + one;
    end if;
  end process;
end timing;


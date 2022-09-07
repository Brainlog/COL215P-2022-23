library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  generic (number : std_logic_vector(3 downto 0));
  port (clk: in std_logic;
        increment: in std_logic;
        reset: in std_logic;
        relay_signal: out std_logic;
        digit: out std_logic_vector(3 downto 0));
end counter;

architecture count of counter is
  constant one: unsigned := "0001";
--  signal reg_dig: std_logic_vector(3 downto 0):= "0000";
  shared variable reg_dig: std_logic_vector(3 downto 0):= "0000";
begin
  digit <= reg_dig;
  process (clk)
  begin
    if (rising_edge(clk)) then
        if (reset = '1') then
          reg_dig := "0000";
        end if;
        if (increment = '1') then
          reg_dig := std_logic_vector(unsigned(reg_dig) + one);
          if (reg_dig = number) then
            reg_dig := "0000";
            relay_signal <= '1';
          else
            relay_signal <= '0';
          end if;
        else 
          relay_signal <= '0'; 
        end if; 
    end if;
  end process;
end count;

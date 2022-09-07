library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_slower is
  generic (number : integer);
  port (clk: in std_logic;
        pause: in std_logic;
        start: in std_logic;
        new_clk: out std_logic);
end clock_slower;

architecture timing of clock_slower is
  shared variable count: integer:= 0;
  signal reg_p: std_logic:= '0';
begin
  process (clk)
  begin
    if (rising_edge(clk)) then
        if (pause = '1') then
          reg_p <= '1';
        end if;
        if (start = '1') then
          reg_p <= '0';
        end if;
        if (reg_p = '0') then
          count := count + 1;
          if (count = number) then
            count := 0;
            new_clk <= '1';
          else
            new_clk <= '0';
          end if;
        else
          new_clk <= '0';
        end if;
    end if;
  end process;
end timing;

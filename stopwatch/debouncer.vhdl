library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is
  generic (clk_cycles_req: integer);
  port (clk: in std_logic;
        input: in std_logic;
        output: out std_logic);
end debouncer;

architecture debounce of debouncer is
  shared variable count: integer:= 0;
  signal state: std_logic:= '0';
  signal prev: std_logic:= '0';
begin
  output <= state;
  process (clk)
  begin
    if (rising_edge(clk)) then
      if (prev = input) then
        count := count + 1;
      else
        count := 0;
      end if;
      if (count = clk_cycles_req) then
        count := 0;
        state <= input;
      end if;
      prev <= input;
    end if;
  end process;
end debounce;



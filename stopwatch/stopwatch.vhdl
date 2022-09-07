library ieee;
use ieee.std_logic_1164.all;

entity stopwatch is
  port (start, reset, pause, clk: in std_logic;
        dp: out std_logic;
        anodes: out std_logic_vector(3 downto 0);
        cathodes: out std_logic_vector(6 downto 0));
end stopwatch;

architecture sw of stopwatch is
  component debouncer is
    generic (clk_cycles_req: integer);
    port (clk: in std_logic;
          input: in std_logic;
          output: out std_logic);
  end component;
  component clock_slower is
    generic (number : integer);
    port (clk: in std_logic;
          pause: in std_logic;
          start: in std_logic;
          new_clk: out std_logic);
  end component;
  component counter is                  
    generic (number : std_logic_vector(3 downto 0));
    port (clk: in std_logic;
        increment: in std_logic;
        reset: in std_logic;
        relay_signal: out std_logic;
        digit: out std_logic_vector(3 downto 0));
  end component;
  component led_driver is
  port (dig0, dig1, dig2, dig3: in std_logic_vector(3 downto 0);
        clk: in std_logic;
        anodes: out std_logic_vector(3 downto 0);
        dp: out std_logic;
        cathodes: out std_logic_vector(6 downto 0));
  end component;
  signal dig0, dig1, dig2, dig3: std_logic_vector(3 downto 0);
  signal r0, r1, r2, r3: std_logic;
  signal tenths: std_logic;
  signal db_start, db_reset, db_pause, db_pause_or_reset: std_logic;
  signal overall_time: integer;
  constant debouncing_factor: integer:= 1000000;
begin
  db_pause_or_reset <= db_pause or db_reset;
  th: clock_slower generic map (10000000) port map (clk, db_pause_or_reset, db_start, tenths);
  db1: debouncer generic map (debouncing_factor) port map (clk, start, db_start);
  db2: debouncer generic map (debouncing_factor) port map (clk, reset, db_reset);
  db3: debouncer generic map (debouncing_factor) port map (clk, pause, db_pause);
  c1: counter generic map ("1010") port map (clk, tenths, db_reset, r0, dig3);
  c2: counter generic map ("1010") port map (clk, r0, db_reset, r1, dig2);
  c3: counter generic map ("0110") port map (clk, r1, db_reset, r2, dig1);
  c4: counter generic map ("1010") port map (clk, r2, db_reset, r3, dig0);
  ld: led_driver port map (dig0, dig1, dig2, dig3, clk, anodes, dp, cathodes);
end sw;

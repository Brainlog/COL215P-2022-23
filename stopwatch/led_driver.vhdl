library ieee;
use ieee.std_logic_1164.all;

entity led_driver is
  port (dig0, dig1, dig2, dig3: in std_logic_vector(3 downto 0);
        clk: in std_logic;
        anodes: out std_logic_vector(3 downto 0);
        dp: out std_logic;
        cathodes: out std_logic_vector(6 downto 0));
end led_driver;

architecture ld of led_driver is
  component seven_segment is
    port ( x : in  std_logic_vector(3 downto 0);
           cathode: out std_logic_vector(6 downto 0));
  end component;
  component timer is
    port (clk: in std_logic;
          sel: out std_logic_vector(1 downto 0));
  end component;
  component mux is
    port (dig0, dig1, dig2, dig3: in std_logic_vector(3 downto 0);
          sel: in std_logic_vector(1 downto 0);
          output: out std_logic_vector(3 downto 0));
  end component;
  component inverted_decoder is
    port (sel: in std_logic_vector(1 downto 0);
          inv_decode: out std_logic_vector(3 downto 0));
  end component;
  signal sel: std_logic_vector(1 downto 0);
  signal mux_output: std_logic_vector(3 downto 0);
begin
  dp <= sel(0);
  Multiplex: mux port map (dig0, dig1, dig2, dig3, sel, mux_output);
  SegmentDecode: seven_segment port map (mux_output, cathodes);
  Timing: timer port map (clk, sel);
  id: inverted_decoder port map (sel, anodes);
end ld;
  

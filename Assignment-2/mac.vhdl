library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.data.all;

entity mac is
  port (din1,din2: in std_logic_vector(data_width-1 downto 0);
        clk: in std_logic;
        cntrl : in std_logic;
        dout: out std_logic_vector(data_width-1 downto 0));
end mac;

architecture mc of mac is
  signal res : std_logic_vector(data_width*2-1 downto 0) := ( others => '0' );
begin
  process(clk)
  begin
    if rising_edge(clk) then       
      if cntrl = '1' then
        res <= std_logic_vector((unsigned(din1) * unsigned(din2)));
      else
        res <= std_logic_vector(unsigned(std_logic_vector((unsigned(din1) * unsigned(din2)))) + unsigned(res));
      end if;
    end if;
  end process ; 
  dout <= res(data_width-1 downto 0);
end;   

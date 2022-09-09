library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mac is
  port (din1,din2: in std_logic_vector(7 downto 0);
        clk: in std_logic;
        cntrl : in std_logic;
        dout: out std_logic_vector(7 downto 0));
end mac;

architecture mc of mac is
  signal res : std_logic_vector(15 downto 0) := "0000000000000000";
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
  dout <= res(7 downto 0);
end;   

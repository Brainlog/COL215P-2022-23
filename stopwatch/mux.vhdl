library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port (dig0, dig1, dig2, dig3: in std_logic_vector(3 downto 0);
        sel: in std_logic_vector(1 downto 0);
        output: out std_logic_vector(3 downto 0));
end mux;

architecture mx of mux is
begin
  process (sel, dig0, dig1, dig2, dig3)
  begin
    case sel is
      when "00" =>
        output <= dig0;
      when "01" =>
        output <= dig1;
      when "10" =>
        output <= dig2;
      when "11" =>
        output <= dig3;
      when others =>
        output <= dig0;
    end case;
  end process;
end mx;

  

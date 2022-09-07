library ieee;
use ieee.std_logic_1164.all;

entity inverted_decoder is
  port (sel: in std_logic_vector(1 downto 0);
        inv_decode: out std_logic_vector(3 downto 0));
end inverted_decoder;

architecture id of inverted_decoder is
begin
  process (sel)
  begin
    case sel is
      when "00" =>
        inv_decode <= "0111";
      when "01" =>
        inv_decode <= "1011";
      when "10" =>
        inv_decode <= "1101";
      when "11" =>
        inv_decode <= "1110";
      when others =>
        inv_decode <= "1111";
    end case;
  end process;
end id;

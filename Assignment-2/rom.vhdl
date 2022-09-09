library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity rom is
  port(address_rom1 : in std_logic_vector(17 downto 0);
       dout_rom1 : out std_logic_vector(7 downto 0);
       address_rom2 : in std_logic_vector(17 downto 0);
       dout_rom2 : out std_logic_vector(7 downto 0));       
end rom;  

architecture beh of rom is

  Type list is array(150000 downto 0) of std_logic_vector(7 downto 0);
  signal mem : list := ( others => "00000000" );
  
begin
  
  dout_rom1 <= mem(to_integer(unsigned(address_rom1)));
  dout_rom2 <= mem(to_integer(unsigned(address_rom2)));
  
end beh;   

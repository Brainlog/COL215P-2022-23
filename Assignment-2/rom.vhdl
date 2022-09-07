library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity rom is
	port(
    
        address_rom : in std_logic_vector(17 downto 0);
        dout_rom : out std_logic_vector(7 downto 0);
        clk: in std_logic;
        re : in std_logic);       
end rom;  

architecture beh of rom is

Type list is array(150000 downto 0) of std_logic_vector(7 downto 0);
signal mem : list := ( 0 => "00000010", 1 => "00000011", 2 => "00000111", 
others => "00000000"
);

signal index : integer range 0 to 150000;
begin 
process(clk, re, address_rom)
	begin
    if rising_edge(clk) then
        if(re = '1') then
            index <= to_integer(unsigned(address_rom));
          
        end if;
    end if;    
   
   end process;
     dout_rom <= mem(index);
   
end beh;   
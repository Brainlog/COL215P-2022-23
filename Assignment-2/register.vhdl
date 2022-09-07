library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity register_a is
	port(    
        din : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(7 downto 0);
        clk: in std_logic;
        re : in std_logic;
        we : in std_logic);    
end register_a;  

architecture beh of register_a is
signal reg : std_logic_vector(7 downto 0) := "00001111";
begin 

process(din, clk, re, we)
	begin
    if falling_edge(clk) then
        if (we = '1') then
            reg <= din;
        else
         reg <= reg;
        end if;   
    end if;    
    if rising_edge(clk) then
        if (re = '1') then
            dout <= reg;
        else 
        	reg <= reg;
        end if;     
    end if;       
end process;
	
   
end beh;   
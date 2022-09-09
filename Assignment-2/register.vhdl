library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity register_a is
  port(    
    din : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(7 downto 0);
    clk: in std_logic;
    -- re : in std_logic;
    we : in std_logic);    
end register_a;  

architecture beh of register_a is
  signal reg : std_logic_vector(7 downto 0) := "00001111";
begin 
  dout <= reg;
  process(clk)
  begin
    if rising_edge(clk) then
      if (we = '1') then
        reg <= din;
      end if;   
    end if;    
  end process;  
end beh;   

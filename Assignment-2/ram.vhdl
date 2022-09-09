library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity ram is
  port(
    din : in  std_logic_vector(7 downto 0);
    address_ram : in std_logic_vector(14 downto 0);
    dout : out std_logic_vector(7 downto 0);
    clk: in std_logic;
    -- re : in std_logic;
    we : in std_logic);       
end ram;  

architecture beh of ram is

  Type list is array(15000 downto 0) of std_logic_vector(7 downto 0);
  signal mem : list := (others => "00000000");
  
begin
  
  dout <= mem(to_integer(unsigned(address_ram)));
  process(clk)
  begin
    if rising_edge(clk) then
      if(we = '1') then
        mem(to_integer(unsigned(address_ram))) <= din;
      end if;
    end if;   
  end process;
end beh;


library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.data.all;

entity ram is
  
  generic (addr_size : integer;
           ram_size : integer);
  port(din : in  std_logic_vector(data_width-1 downto 0);
    address_ram : in std_logic_vector(addr_size-1 downto 0);
    dout : out std_logic_vector(data_width-1 downto 0);
    clk: in std_logic;
    we : in std_logic);
  
end ram;  

architecture beh of ram is

  Type mem_type is array(ram_size-1 downto 0) of std_logic_vector(data_width-1 downto 0);
  signal mem : mem_type := (others => "00000000");
  
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


library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.data.all;
use std.textio.all;

entity rom is
    generic (addr_size : integer;
             rom_size : integer);
  port(address_rom : in std_logic_vector(addr_size-1 downto 0);
       dout_rom : out std_logic_vector(data_width-1 downto 0));
end rom;  

architecture beh of rom is

  Type mem_type is array(0 to rom_size-1) of std_logic_vector(data_width-1 downto 0);
  
  impure function init_mem(mif_file_name : in string) return mem_type is
    file mif_file : text open read_mode is mif_file_name;
    variable mif_line : line;
    variable temp_bv : bit_vector(data_width-1 downto 0);
    variable temp_mem : mem_type;
  begin
    for i in mem_type'range loop
      readline(mif_file, mif_line);
      read(mif_line, temp_bv);
      temp_mem(i) := to_stdlogicvector(temp_bv);
    end loop;
    return temp_mem;
  end function;
  
  signal mem : mem_type := ( others => "00000000" );
  
begin
  
  dout_rom <= mem(to_integer(unsigned(address_rom)));
  
end beh;   

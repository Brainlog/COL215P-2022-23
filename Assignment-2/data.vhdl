library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package data is

  constant data_width : integer := 8;
  constant rom_size1 : integer := 784;
  constant rom_addr_size1 : integer := 10;
  constant ram_size : integer := 150;
  constant ram_addr_size : integer := 8;
  constant image_size : integer := 784;
  constant image_file_name : string := "imgdata.mif";
  
  -- three addresses, rom_add1 = 0, rom_add2 = 0, ram_add = 0
  type control_state is (S0, -- start state, put rom_dout1 and rom_dout2 in registers
                         S1, -- compute from mac
                         S2, -- write data from mac to ram_add, update rom_add1,
                             -- rom_add2 and ram_add, goto S0 or S3 depending
                             -- on conditions
                         S3, -- first layer computation done, same as S0 but we
                             -- put ram_dout into first register
                         S4, -- compute from mac
                         S5, -- 
                         S6,
                         S7,
                         S8,
                         S9,
                         S10,
                         S11,
                         S12,
                         S13);
end package;

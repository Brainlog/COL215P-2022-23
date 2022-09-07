library ieee;
use ieee.std_logic_1164.all;

entity seven_segment is
  port ( x : in  std_logic_vector(3 downto 0);
         cathode : out std_logic_vector(6 downto 0));
end seven_segment;
--  cathode(0)
--F   B
--  G
--E   C
--  D
architecture behv of seven_segment is
begin
  -- A = (a+b+c+d').(b'+c+d)
  -- B = (b'+c'+d).(b'+c+d')
  -- C = (b+c'+d)
  -- D = (a+b+c+d').(b'+c+d).(b'+c'+d')
  -- E = ((b+c+d).(c'+d))'
  -- F = (a+b+c+d').(b+c').(b'+c'+d')
  -- G = (a+b+c).(b'+c'+d')
  
  cathode(6) <= not((x(3) or x(2) or x(1) or (not x(0))) and ((not x(2)) or x(1) or x(0)));
  cathode(5) <= not(((not x(2)) or (not x(1)) or x(0)) and ((not x(2)) or x(1) or (not x(0))));
  cathode(4) <= not((x(2) or (not x(1)) or x(0)));
  cathode(3) <= not((x(3) or x(2) or x(1) or (not x(0))) and ((not x(2)) or x(1) or x(0)) and ((not x(2)) or (not x(1)) or (not x(0))));
  cathode(2) <= ((x(2) or x(1) or x(0)) and ((not x(1)) or x(0)));
  cathode(1) <= not((x(3) or x(2) or x(1) or (not x(0))) and (x(2) or (not x(1))) and ((not x(2)) or (not x(1)) or (not x(0))));
  cathode(0) <= not((x(3) or x(2) or x(1)) and ((not x(2)) or (not x(1)) or (not x(0))));
    
end behv;

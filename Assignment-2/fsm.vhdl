library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity fsm is
	port(
        clk : in std_logic;
        );       
end fsm;  


architecture beh of fsm is
    component mac is
        port (din1,din2: in std_logic_vector(7 downto 0);
              clk: in std_logic;
              cntrl : in std_logic;
                dout: out std_logic_vector(7 downto 0));
      end component;
    component register_a is
        port(
        
            din : in std_logic_vector(7 downto 0);
            dout : out std_logic_vector(7 downto 0);
            clk: in std_logic;
            re : in std_logic;
            we : in std_logic);     
    end component;  
    component rom is
        port(
      
          address_rom : in std_logic_vector(17 downto 0);
          dout_rom : out std_logic_vector(7 downto 0);
          clk: in std_logic;
          re : in std_logic
  
          ); 
    end component;      
    component ram is
        port(
                  din : in  std_logic_vector(7 downto 0);
                  address_ram : in std_logic_vector(14 downto 0);
                  dout : out std_logic_vector(7 downto 0);
                  clk: in std_logic;
                  re : in std_logic;
                  we : in std_logic);     
    end component;  
    
   signal state : std_logic_vector(3 downto 0) := "0000";


   signal clk : std_logic = '1';
   signal cntrl : std_logic = '0';
   signal din1_mac : std_logic_vector(7 downto 0) := (others => '0');
   signal din2_mac : std_logic_vector(7 downto 0) := (others => '0');
   signal dout_ram : std_logic_vector(7 downto 0) := (others => '0');
   signal dout_rom : std_logic_vector(7 downto 0) := (others => '0');
   signal address_rom : std_logic_vector(17 downto 0) := (others => '0');
   signal address_ram : std_logic_vector(14 downto 0) := (others => '0');
   signal din_ram : std_logic_vector(7 downto 0) := (others => '0');
   signal re_ram : std_logic = '0';
   signal we_ram : std_logic = '0';
   signal re_rom : std_logic = '0';
   signal dout_mac : std_logic_vector(7 downto 0) := (others => '0');


   signal re_reg1 : std_logic = '0';
   signal we_reg1 : std_logic = '0';
   signal dout_reg1 : std_logic_vector(7 downto 0) := (others => '0');  
   signal din_reg1 : std_logic_vector(7 downto 0) := (others => '0');

   signal re_reg2 : std_logic = '0';
   signal we_reg2 : std_logic = '0';
   signal dout_reg2 : std_logic_vector(7 downto 0) := (others => '0');  
   signal din_reg2 : std_logic_vector(7 downto 0) := (others => '0');

   signal re_reg3 : std_logic = '0';
   signal we_reg3 : std_logic = '0';
   signal dout_reg3 : std_logic_vector(7 downto 0) := (others => '0');  
   signal din_reg3 : std_logic_vector(7 downto 0) := (others => '0');




 begin 
        mac1 : mac port map(din1_mac, din2_mac, clk, cntrl, dout_mac);
        rom1 : rom port map(address_rom, dout_rom, clk, re_rom);
        ram1 : ram port map(din_ram, address_ram, dout_ram, clk, re_ram, we_ram);
        reg1 : register_a port map(din_reg1, dout_reg1, clk, re_reg1, we_reg1);
        reg2 : register_a port map(din_reg2, dout_reg2, clk, re_reg2, we_reg2);
        reg3 : register_a port map(din_reg3, dout_reg3, clk, re_reg3, we_reg3);
 process(clk)
	begin
        if rising_edge(clk) then
            case state is
                when "0000" =>
                when "0001" =>
                when "0010" =>
                when "0011" =>
                when "0100" =>
                when "0101" =>
                when "0110" =>
                when "0111" =>
                when "1000" =>
                when "1001" =>
                when "1010" =>
                when "1011" =>
                when "1100" =>
                when "1101" =>
                when "1110" =>
                when "1111" =>
                when others =>

   end process;
end beh;
    

library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.data.all;

entity fsm is
  port(clk : in std_logic);       
end fsm;  

architecture beh of fsm is
  component mac is
    port (din1,din2: in std_logic_vector(data_width-1 downto 0);
          clk: in std_logic;
          cntrl : in std_logic;
          dout: out std_logic_vector(data_width-1 downto 0));
  end component;
  component register_a is
    port(din : in std_logic_vector(data_width-1 downto 0);
         dout : out std_logic_vector(data_width-1 downto 0);
         clk: in std_logic;
         we : in std_logic);     
  end component;  
  component rom is
    generic (addr_size : integer;
             rom_size : integer);
    port(address_rom : in std_logic_vector(addr_size-1 downto 0);
         dout_rom : out std_logic_vector(data_width-1 downto 0));
  end component;      
  component ram is
    generic (addr_size : integer;
             ram_size : integer);
    port(din : in  std_logic_vector(data_width-1 downto 0);
         address_ram : in std_logic_vector(addr_size-1 downto 0);
         dout : out std_logic_vector(data_width-1 downto 0);
         clk: in std_logic;
         we : in std_logic);
  end component;  
  
  signal state : control_state := S0;

-- mac signals
  signal cntrl : std_logic := '0';
  signal din1_mac : std_logic_vector(data_width-1 downto 0) := (others => '0');
  signal din2_mac : std_logic_vector(data_width-1 downto 0) := (others => '0');
  signal dout_mac : std_logic_vector(data_width-1 downto 0) := (others => '0');
-- rom signals  
  signal dout_rom1 : std_logic_vector(data_width-1 downto 0) := (others => '0');
  signal address_rom1 : std_logic_vector(rom_addr_size1-1 downto 0) := (others => '0');
  -- signal dout_rom2 : std_logic_vector(data_width-1 downto 0) := (others => '0');
  -- signal address_rom2 : std_logic_vector(rom_addr_size2-1 downto 0) := (others => '0');
-- ram signals
  signal address_ram : std_logic_vector(ram_addr_size-1 downto 0) := (others => '0');
  signal din_ram : std_logic_vector(data_width-1 downto 0) := (others => '0');
  signal we_ram : std_logic := '0';
  signal dout_ram : std_logic_vector(data_width-1 downto 0) := (others => '0');
--   register mac 1 signals
  signal we_reg1 : std_logic := '0';
  signal dout_reg1 : std_logic_vector(data_width-1 downto 0) := (others => '0');  
  signal din_reg1 : std_logic_vector(data_width-1 downto 0) := (others => '0');
-- register mac 2 signals
  signal we_reg2 : std_logic := '0';
  signal dout_reg2 : std_logic_vector(data_width-1 downto 0) := (others => '0');  
  signal din_reg2 : std_logic_vector(data_width-1 downto 0) := (others => '0');

-- fsm control signals
  signal count_image : integer := 0; -- counter increase till 783 and set to 0, and count_hidden += 1
  signal count_hidden : integer := 0; -- when reach 129, stop reading rom, read from ram
  signal count_ram_hidden : integer := 0; -- count ram address till 128 and count_ram_final += 1
  signal count_ram_final : integer := 0; -- when reach 10 stop



begin 
  mac1 : mac port map(din1_mac, din2_mac, clk, cntrl, dout_mac);
  rom1 : rom generic map (rom_addr_size1, rom_size1) port map(address_rom1, dout_rom1);
  ram1 : ram generic map (ram_addr_size, ram_size) port map(din_ram, address_ram, dout_ram, clk, we_ram);
  reg1 : register_a port map(din_reg1, dout_reg1, clk, we_reg1);
  reg2 : register_a port map(din_reg2, dout_reg2, clk, we_reg2);
  process(clk)
  begin
    
    -- case state is
    --   when "0000" =>   
        
    --   when "0001" =>
        
    --   when "0010" =>
        
    --   when "0011" =>

    --   when "0100" =>

    --   when "0101" =>

    --   when "0110" =>

    --   when "0111" =>

    --   when "1000" =>

    --   when "1001" =>

    --   when "1010" =>

    --   when "1011" =>

    --   when "1100" =>

    --   when "1101" =>

    --   when "1110" =>

    --   when "1111" =>

    --   when others =>
    -- end case;
    
  end process;
end beh;
  

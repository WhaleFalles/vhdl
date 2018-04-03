library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity input is
port(clk: in std_logic;
     sw_bus:in std_logic;
     button32:in std_logic;
     num:out std_logic_vector(7 downto 0));
end entity;
architecture one of input is
signal num_reg:std_logic_vector(7 downto 0);
begin
 process(clk)
  begin
    if(sw_bus='1')then num_reg<="00000000";
    elsif (button32='0' and button32'event)then
     num_reg<=num_reg+"00000001";end if;
    
  --
 end process;
 num<=num_reg when sw_bus='0' else
      "ZZZZZZZZ";
end one;
  
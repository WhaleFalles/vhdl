library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity jishuqi is
port(clk:in std_logic;
     clk_t:out std_logic_vector(3 downto 0));
end jishuqi;
architecture  one of jishuqi is
signal clk_reg:std_logic_vector(3 downto 0):="0000";
begin
 process(clk)
 begin
  if(clk='1' and clk'event )then
    clk_t<=clk_reg;
    if(clk_reg="1000")then clk_reg<="0000";
    else clk_reg<=clk_reg+"0001";
    end if;
  end if;
 end process;
end one;
   
library ieee;
use ieee.std_logic_1164.all;
entity mux8 is
port(r1,r2,r4,r5:in std_logic_vector(7 downto 0);
     clk_t:in std_logic_vector(3 downto 0);
     num_show:out std_logic_vector(3 downto 0));
end entity;
architecture one of mux8 is
begin
   num_show<=r1(7 downto 4) when clk_t="0000"else
             r1(3 downto 0) when clk_t="0001"else 
             r2(7 downto 4) when clk_t="0010"else   
             r2(3 downto 0) when clk_t="0011"else   
             r4(7 downto 4) when clk_t="0100"else   
             r4(3 downto 0) when clk_t="0101"else   
             r5(7 downto 4) when clk_t="0110"else   
             r5(3 downto 0);
end one;
      
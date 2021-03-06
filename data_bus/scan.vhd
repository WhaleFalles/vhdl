library ieee;
use ieee.std_logic_1164.all;
entity sacn is
port(clk_t:in std_logic_vector(3 downto 0);
     scan_sel:out std_logic_vector(7 downto 0));
   --  scan_d:out std_logic_vector(6 downto 0));
end entity;
architecture one of sacn is
begin
 scan_sel<="01111111"when clk_t="0000"else
       "10111111"when clk_t="0001"else
       "11011111"when clk_t="0010"else
       "11101111"when clk_t="0011"else
       "11110111"when clk_t="0100"else
       "11111011"when clk_t="0101"else
       "11111101"when clk_t="0110"else 
       "11111110"when clk_t="0111"else
       "11111111";
end one;
     
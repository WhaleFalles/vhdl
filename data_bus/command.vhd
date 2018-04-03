library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity command is
port(clk_t:in std_logic;
     button:in std_logic;
     bus_sel:out std_logic_vector(4 downto 0);
     ld_reg:out std_logic_vector(4 downto 0);
     alu_sel:out std_logic_vector(5 downto 0);
     pc_sel:out std_logic_vector(2 downto 0);
     we_rd:out std_logic_vector(1 downto 0);
     memenab:out std_logic);
end entity;
architecture one of command is
signal beats:std_logic_vector(3 downto 0):="0000";
begin
  process(clk_t)
  begin
    if(clk_t='1' and clk_t'event )then
      if(button='0')then
        beats<=beats+"0001";
       end if; 
    end if;
  end process;
 
 process(beats)
 begin
   if(beats="0001")then
   bus_sel<="11111";ld_reg<="00000";pc_sel<="100";we_rd<="01";memenab<='1';
   elsif (beats="0010")then 
   bus_sel<="11110";ld_reg<="00001";pc_sel<="100";we_rd<="01";memenab<='1';
   elsif (beats="0011")then 
   bus_sel<="11111";ld_reg<="00100";pc_sel<="111";we_rd<="01";memenab<='1';
   elsif (beats="0100")then 
   bus_sel<="10111";ld_reg<="10001";pc_sel<="111";we_rd<="00";memenab<='1';
   elsif (beats="0101")then 
   bus_sel<="11110";ld_reg<="00001";pc_sel<="111";we_rd<="01";memenab<='1';
   elsif (beats="0110")then 
   bus_sel<="11111";ld_reg<="00010";pc_sel<="111";we_rd<="01";memenab<='1';
   elsif (beats="0111")then 
   bus_sel<="11011";ld_reg<="01000";pc_sel<="111";we_rd<="01";memenab<='1';
   elsif (beats="1000")then 
   bus_sel<="11101";ld_reg<="00100";pc_sel<="100";we_rd<="10";memenab<='1';
   end if;
end process;
end one;

library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity pc_ar is
port(	clk_cdu,pcclr,pcld,pcen:in std_logic;
		sw_bus,pc_bus,ldar:in std_logic;
		inputed:in std_logic_vector(7 downto 0);
		arout:out std_logic_vector(7 downto 0);
		d:inout std_logic_vector(7 downto 0);
		pcshow:out std_logic_vector(7 downto 0);
		clk:in std_logic);
end pc_ar;
architecture rt1 of pc_ar is
signal pc,ar,bus_reg:std_logic_vector(7 downto 0);
begin
seq1:process(clk_cdu,ldar,bus_reg)
	begin
		if clk'event and clk='1' then
			if ldar='1' then
				ar<=bus_reg;
			end if;
		end if;
	end process;
seq2:process(clk_cdu,pcclr,pcld,pcen,bus_reg)
	begin
		if pcclr='0' then
			pc<=(others=>'0');
		elsif clk_cdu'event and clk_cdu='1' then
			if(pcld='0'and pcen='1') then
				pc<=bus_reg;
			elsif(pcld='1'and pcen='1') then
				pc<=pc+1;
			end if;
		end if;
	end process;
bus_reg<=inputed when(sw_bus='0' and pc_bus='1')else
		pc when (sw_bus='1'and pc_bus='0')else
		d;
d<=bus_reg when (sw_bus='0'or pc_bus='0')else
	(others=>'Z');
arout<=ar;
pcshow<=pc;
end rt1;

library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop is
port(
	CLK: in std_logic;
	CLR: in std_logic;
	D: in std_logic;
	Q: out std_logic
);
end entity;

architecture arch of DFlipFlop is
signal Qm: std_logic; 

begin

process (CLK, CLR) is
begin

	if (CLR = '1') then
			Qm <= '0';

	elsif (CLK = '1' and CLK'event) then
		
			Qm <= D;
	end if;

end process;

process (CLK, CLR) is
begin

	if (CLR = '1') then
			Q <= '0';

	elsif (CLK = '0' and CLK'event) then
		
			Q <= Qm; 
	end if;

end process;
end architecture;

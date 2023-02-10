library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity AddSub is
port(
	X: in std_logic_vector (3 downto 0);
	Y: in std_logic_vector (3 downto 0);
	Carry_in: in std_logic;
	S: out std_logic_vector (3 downto 0);
	Overflow: out std_logic;
	Mode: in std_logic
);
end AddSub;

architecture arch of AddSub is

signal carry_in_int : integer range 0 to 1;

begin

process (X, Y, Carry_in, Mode)
begin

if (carry_in = '0') then
	carry_in_int <= 0;
end if;

if (carry_in = '1') then
	carry_in_int <= 1;
end if;

if (Mode = '0') then

	if (to_integer(unsigned(X)) + to_integer(unsigned(Y)) + carry_in_int > 15) then		
		Overflow <= '1';
	else
		Overflow <= '0';
	end if;

	S <= X + Y + Carry_in;

end if;

if (Mode = '1') then

	if (to_integer(unsigned(X)) < to_integer(unsigned(Y)) + carry_in_int + 1) then		
		Overflow <= '1';
	else
		Overflow <= '0';
	end if;

	S <= X - (Y + Carry_in);

end if;

end process;

end architecture;
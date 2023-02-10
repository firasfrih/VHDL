library ieee;
use ieee.std_logic_1164.all;

entity AddSub_tb is
end AddSub_tb;

architecture arch of AddSub_tb is

component AddSub is
port(
	X: in std_logic_vector (3 downto 0);
	Y: in std_logic_vector (3 downto 0);
	Carry_in: in std_logic;
	S: out std_logic_vector (3 downto 0);
	Overflow: out std_logic;
	Mode: in std_logic
);
end component;

signal X: std_logic_vector (3 downto 0) := "0000";
signal Y: std_logic_vector (3 downto 0) := "0000";
signal Carry_in: std_logic := '0';
signal S: std_logic_vector (3 downto 0) := "0000";
signal Overflow: std_logic := '0';
signal Mode: std_logic := '0';

begin

dut:AddSub port map(X => X, Y => Y, Carry_in => Carry_in, S => S, Overflow => Overflow, Mode => Mode);

process
begin

X <= "1010"; Y <= "0100"; Carry_in <= '0'; Mode <= '0'; wait for 5 ns;
X <= "1010"; Y <= "0100"; Carry_in <= '1'; Mode <= '0'; wait for 5 ns;
X <= "1111"; Y <= "1111"; Carry_in <= '0'; Mode <= '0'; wait for 5 ns;
X <= "1111"; Y <= "1111"; Carry_in <= '1'; Mode <= '0'; wait for 5 ns;

X <= "1010"; Y <= "0100"; Carry_in <= '0'; Mode <= '1'; wait for 5 ns;
X <= "1010"; Y <= "0100"; Carry_in <= '1'; Mode <= '1'; wait for 5 ns;
X <= "1110"; Y <= "1111"; Carry_in <= '0'; Mode <= '1'; wait for 5 ns;
X <= "1111"; Y <= "1111"; Carry_in <= '1'; Mode <= '1'; wait for 5 ns;

end process;

end architecture;
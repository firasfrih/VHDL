library ieee;
use ieee.std_logic_1164.all;

entity EinBitRegister is
port(
	LD: in std_logic;
	D0: in std_logic;
	CLK: in std_logic;
	CLR: in std_logic;
	Q0: out std_logic
);
end entity;

architecture arch of EinBitRegister is

Component DFlipFlop
port(
	CLK: in std_logic;
	CLR: in std_logic;
	D: in std_logic;
	Q: out std_logic
);
end component;

signal Di: std_logic;
signal LD_AND: std_logic;
signal D0_AND: std_logic;

signal Q_aus_FlipFlop: std_logic;

begin

LD_AND <= (NOT LD) AND Q_aus_FlipFlop;

D0_AND <= LD AND D0;

Di <= LD_AND OR D0_AND;
Q0 <= Q_aus_FlipFlop;

FlipFlop:DFlipFlop port map (CLK => CLK, CLR  => CLR, Q => Q_aus_FlipFlop, D => Di);

end architecture;
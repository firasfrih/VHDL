library ieee;
use ieee.std_logic_1164.all;

entity Reg_N is
generic (N: integer :=8);
port(
	LD: in std_logic;
	D0: in std_logic_vector(N-1 DOWNTO 0);
	CLK: in std_logic;
	CLR: in std_logic;
	Q0: out std_logic_vector(N-1 DOWNTO 0)
);
end Reg_N;

architecture arch of Reg_N is 

Component DFlipFlop
port(
	CLK: in std_logic;
	CLR: in std_logic;
	D: in std_logic;
	Q: out std_logic
);
end component;

signal Di: std_logic_vector(N-1 downto 0);
signal LD_AND: std_logic_vector(N-1 downto 0);
signal D0_AND: std_logic_vector(N-1 downto 0);

signal Q_aus_FlipFlop: std_logic_vector(N-1 downto 0);

signal LDv: std_logic_vector(N-1 DOWNTO 0);

begin

LDv <= (others => LD);

LD_AND <= (NOT LDv) AND Q_aus_FlipFlop;

D0_AND <= LDv AND D0;

Di <= LD_AND OR D0_AND;
Q0 <= Q_aus_FlipFlop;

G1: FOR I IN 0 to N - 1 GENERATE
   R1: DFlipFlop
      PORT MAP (CLK => CLK, CLR  => CLR, Q => Q_aus_FlipFlop(I), D => Di(I));
END GENERATE G1;

end architecture;
library ieee;
use ieee.std_logic_1164.all;

Entity EinBitRegister_TB is 
end EinBitRegister_TB;


architecture arch of EinBitRegister_TB is 

component Reg_N
generic (N: integer :=8);
port(
	LD: in std_logic;
	D0: in std_logic_vector(N-1 DOWNTO 0);
	CLK: in std_logic;
	CLR: in std_logic;
	Q0: out std_logic_vector(N-1 DOWNTO 0)
);
end Component;

signal CLK_TB : std_logic := '0';

signal LD: std_logic := '1';
signal D0 : std_logic_vector(3 downto 0) := "1010";
signal Q0 : std_logic_vector(3 downto 0) ;
signal CLR : std_logic := '0';

Begin

CLK_TB <= not CLK_TB after 5 ns;
CLR <= '1' after 2 ns, '0' after 12 ns;
LD <= '1' after 30 ns;
dut:Reg_N 
generic map(N => 4)
port map(CLK => CLK_TB, CLR => CLR, LD => LD, D0 => D0 , Q0 => Q0);


End Architecture;

   

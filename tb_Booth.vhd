library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb_Booth is
end tb_Booth;

architecture behavior of tb_Booth is
signal X, Y : std_logic_vector (3 downto 0);
signal Z : std_logic_vector (7 downto 0);

begin 

uut: entity work.Booth 
port map(X, Y, Z);


X <= "0010" after 0 ns;
Y <= "0011" after 0 ns;

end behavior;

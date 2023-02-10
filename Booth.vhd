library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.Booth_pkg.all;


entity Booth is
    port(
        X, Y : IN std_logic_vector (3 downto 0);
        Z : OUT std_logic_vector (7 downto 0));
end Booth;

architecture behavior of Booth is
begin
    Z <= result(X, Y);
end behavior;

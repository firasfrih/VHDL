-----------------------------------------------------------------------------
--FIRAS FRIH
--Counter : Up counter with either a synchronous reset or asynchronous reset.
-----------------------------------------------------------------------------
library ieee ;
use ieee.std_logic_1164.all ;
use ieee.math_real.all ;
use ieee.numeric_std.all ;

entity Counter is 
       generic (
		         MAX_VAL     : integer := 2**30;
					SYNCH_Reset : boolean := true);
		 port (
		         Max_count  : out std_logic;
					Clk        : in  std_logic;
					Reset      : in  std_logic);
end Counter;

Architecture behavior of Counter is
    constant bit_depth   : integer := integer(ceil(log2(real(MAX_VAL))));
	 signal   count_reg   : unsigned(bit_depth - 1 downto 0) := (others => '0');
	begin
	synch_rst :  if SYNCH_Reset = true generate
	       Count_proc : process (Clk)
			 begin
			   if rising_edge(Clk) then
				   if ((Reset = '0') or (Count_reg = MAX_VAL)) then
					   Count_reg <= (others => '0');
					else
					   Count_reg <= Count_reg + 1;
					end if;
				end if;
			 end process;
	end generate;
	asynch_rst : if SYNCH_Reset = false generate
	       Count_proc : process (Clk,Reset)
			 begin
			    if (Reset = '0') then 
					   Count_reg <= (others => '0');
					elsif rising_edge(Clk) then
					    if (Count_reg = MAX_VAL) then
						    Count_reg <= (others => '0');
						 else
					   Count_reg <= Count_reg + 1;
					end if;
				 end if;
			 end process;
	end generate;
   output_proc : process(Count_reg)
          begin
			    Max_count <= '0';
				 if(Count_reg = MAX_VAL) then
				   MAX_count <= '1';
				 end if;
			 end process;
			 
   end behavior;	
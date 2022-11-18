-----------------------------------------------------------------
-- Firas FRIH
-- Blinky Led
-- Uses a counter that will blink all LEDs on/off at regular
-- intervals. The blink rate is changeable throught the generic
-- of the design. There is an active low reset that when asserted
-- low will cause the count to reset and turn the leads off.
-----------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.math_real.all;
USE IEEE.numeric_std.all;

--ENTITY
ENTITY Blinky_Led IS
    Generic (
	     NUM_LEDS    : integer := 4;
		  CLK_RATE    : integer := 100000000;
		  BLINK_RATE  : integer := 2);
	 PORT (
	     Led_out     : out std_logic_vector(NUM_LEDS-1 DOWNTO 0);
		  Clk         : in std_logic;
		  Reset       : in std_logic );  --active low
END Blinky_Led;

--ARCHITECTURE
Architecture behavior of Blinky_Led is

--calculate the count value to determine the BLINK RATE from the generic
constant MAX_VALUE  : integer := CLK_RATE / BLINK_RATE;

constant BIT_DEPTH  : integer := integer(ceil(log2(real(MAX_VALUE)));

signal count_reg    : unsigned(BIT_DEPTH-1 downto 0):= (others =>'0');

signal led_reg      : std_logic_vector(NUM_LEDS-1 downto 0) := '0000'; --in case toggle is needed can also be done with others

    begin
	 
	 -- Assign output LED values
	 Led_out <= Led_reg;
	 
	 -- Process that increments the counter every rising clock edge
	 count_proc: process(Clk)
    begin
	    if rising_edge(Clk) then
		    if((Reset = '0') or (count_reg = MAX_VALUE)) then
			   count_reg <= (others => '0');
			 else
			   count_reg <= count_reg + 1;
			 end if;
		 end if;
	 end process count_proc;
	 
	 -- Process that will toggle led output every time the counter
	 -- reaches the calculated MAX_VAL
	 output_proc: process(Clk)
    begin
	    if rising_edge(Clk) then
		    if(count_reg = MAX_VALUE) then
			   led_reg <= NOT led_reg;
			 end if;
	    end if;
	 end process output_proc;
	 
end behavior;
	
	
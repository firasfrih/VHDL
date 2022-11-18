------------------------------------------------------------
-- Firas FRIH
-- PWM
-- Produces a pulse width modulated ''PWM'' signal based on 
-- the value input on the input 'Duty_Cycle'.
------------------------------------------------------------

-- Libraries
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- ENTITY
ENTITY PWM_Design IS
Generic (
      BIT_DEPTH   : integer := 8;
		INPUT_CLK   : integer := 50000000; --50MHz
		FREQ        : integer := 50); --50Hz
PORT    (
      Pwm_out     : out  std_logic;
	   Duty_Cycle  : in   std_logic_vector(BIT_DEPTH - 1 downto 0);
		Clk         : in   std_logic;
		Enable      : in   std_logic);
END PWM_Design;

--ARCHITECTURE 
Architecture Behavior of PWM_Design is

--Constants
constant max_freq_count : integer := INPUT_CLK / FREQ;
constant pwm_step       : integer := max_freq_count / (2**BIT_DEPTH);

--Signals
signal   pwm_value      : std_logic := '0';
signal   freq_count     : integer range 0 to max_freq_count := 0;
signal   pwm_count      : integer range 0 to 2**BIT_DEPTH   := 0;
signal   max_pwm_count  : integer range 0 to 2**BIT_DEPTH   := 0;
signal   pwm_step_count : integer range 0 to max_freq_count := 0;

begin
   -- Convert Duty_Cycle to max_pwm_count
	max_pwm_count <= to_integer(unsigned(Duty_Cycle));
	Pwm_Out <= pwm_value;
	
	--Process that runs signal out at the correct frequency 
	freq_counter : process(clk)
	begin
	  if rising_edge(Clk) then
	     if (Enable = '0') then 
		     if (freq_count < max_freq_count) then
			   freq_count <= freq_count + 1;
				if (pwm_count < max_pwm_count) then
				    pwm_value <= '1';
					  if (pwm_step_count < pwm_step) then
					     pwm_step_count <= pwm_step_count + 1;
					  else
					     pwm_step_count <= 0;
						  pwm_count <= 0;
					  end if;
				   else
					 pwm_value <= '0';
				end if;
			  else
			   freq_count <= 0;
			   pwm_count  <= 0;
			end if;
		  else
		      pwm_value <= '0';
		  end if;
	  end if;
	end process freq_counter;
end behavior;


--------------------------------------------------------------------------
-- Student : Firas FRIH
-- Module Name : Button_Led - Behavioral
--------------------------------------------------------------------------

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY Button_Led IS
     Generic (
               NUM_BUTTONS : INTEGER := 2;  --For Altera DE-10 we only have 2 Buttons
         PORT(
             LED_OUT   : OUT std_logic_vector(NUM_BUTTONS - 1 downto 0)
             BUTTON_IN : IN  std_logic_vector(NUM_BUTTONS - 1 downto 0)
             ENABLE    : IN  std_logic);
	  END Button_Led;
	  
	architecture Behavioral of Button_Led is
	Begin
	--Set the output of the Leds
	LED_OUT <= not BUTTON_IN when ENABLE = '0' else (others => '0');
	
	
	End Behavioral;
				 
 
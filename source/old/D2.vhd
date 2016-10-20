----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:43 02/23/2016 
-- Design Name: 
-- Module Name:    D2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity D2 is
	generic (divD1,divD2 : integer := 10);
    Port ( sysclk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           pulse1 : out  STD_LOGIC;
           pulse2 : out  STD_LOGIC);
end D2;

architecture struct of D2 is
		COMPONENT deler
		generic (div : integer := 10);
		port (sysclk,en : IN std_logic;
				pulse : OUT std_logic);
		END COMPONENT;
	signal PulseD1enD2 : std_logic := '0';
	--parameterwaarden

begin
		D1: deler GENERIC MAP (div =>divD1)
					 PORT MAP (sysclk =>sysclk,en=>en,pulse=>PulseD1enD2);
		D2: deler GENERIC MAP (div =>divD2)
					 PORT MAP (sysclk =>sysclk, en=>PulseD1enD2,pulse=>pulse2);
		pulse1 <= pulseD1enD2;
end struct;


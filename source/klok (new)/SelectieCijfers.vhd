----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:48:56 11/10/2016 
-- Design Name: 
-- Module Name:    SelectieCijfers - Behavioral 
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

entity SelectieCijfers is
    Port ( sysclk : in STD_LOGIC;
			  idig : in  STD_LOGIC_VECTOR (23 downto 0);
           istate : in  STD_LOGIC_VECTOR (7 downto 0);
           odig1 : out  STD_LOGIC_VECTOR (3 downto 0);
           odig2 : out  STD_LOGIC_VECTOR (3 downto 0);
           odig3 : out  STD_LOGIC_VECTOR (3 downto 0);
           odig4 : out  STD_LOGIC_VECTOR (3 downto 0));
end SelectieCijfers;

architecture Behavioral of SelectieCijfers is	
begin
	SELCIJFER:process(sysclk)
	begin
			if rising_edge(sysclk) then
				case istate is
					when "00000100" =>				 	--:SS
						odig4 <= "0000";
						odig3 <= "0000";
						odig2 <= idig(7 downto 4);
						odig1 <= idig(3 downto 0);
					when "00100000" =>				 	--:JJ
						odig4 <= "0000";
						odig3 <= "0000";
						odig2 <= idig(7 downto 4);
						odig1 <= idig(3 downto 0);
					when others => 						--UU:MM, DD:MM
						odig4 <= idig(23 downto 20);
						odig3 <= idig(19 downto 16);
						odig2 <= idig(15 downto 12);
						odig1 <= idig(11 downto 8);
				end case;
			end if;
	end process;
end Behavioral;


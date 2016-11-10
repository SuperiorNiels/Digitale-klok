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
    Port ( idig : in  STD_LOGIC_VECTOR (23 downto 0);
           istate : in  STD_LOGIC_VECTOR (3 downto 0);
           odig1 : out  STD_LOGIC_VECTOR (3 downto 0);
           odig2 : out  STD_LOGIC_VECTOR (7 downto 4);
           odig3 : out  STD_LOGIC_VECTOR (11 downto 8);
           odig4 : out  STD_LOGIC_VECTOR (15 downto 12));
end SelectieCijfers;

architecture Behavioral of SelectieCijfers is	
begin
SELCIJFER : process(istate,idig)
	begin
			if istate = "0001" or istate = "0010" or istate = "0100" then --Instellen UU, MM en weergave
				odig1(3 downto 0) <= idig(11 downto 9);
				odig2(7 downto 4) <= idig(15 downto 12);
				odig3(11 downto 8) <= idig(19 downto 16);
				odig4(15 downto 12) <= idig(23 downto 20);
			elsif istate = "1000" then --Instellen SS 
				odig1(3 downto 0) <= idig(3 downto 0);
				odig2(7 downto 4) <= idig(7 downto 4);
				odig3(11 downto 8) <= "0000";
				odig4(15 downto 12) <= "0000";
			end if;
	end process;
end Behavioral;


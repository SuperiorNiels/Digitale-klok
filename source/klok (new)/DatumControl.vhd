----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
-- 
-- Create Date:    10:56:54 11/16/2016 
-- Design Name: 
-- Module Name:    DatumControl - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity DatumControl is
    Port ( count : in STD_LOGIC_VECTOR (23 downto 0);
           maxDag : out  STD_LOGIC_vector); -- max dag
end DatumControl;

architecture Behavioral of DatumControl is
 --Interne signalen voor huidige datum
	signal huidigJaar 		: 	integer range 0 to 99;
	signal huidigMaand		: 	integer range 0 to 99;
	signal schrikkeljaar : std_logic := '0';
begin
 MAX_BEP : process(count)
	begin
		huidigJaar <= to_integer(unsigned(count(23 downto 16)));
		huidigMaand <= to_integer(unsigned(count(15 downto 8)));

		if huidigJaar mod 4 = 0 then schrikkeljaar <= '1'; --Check schrikkeljaar
		else schrikkeljaar <= '0';
		end if;
		if huidigMaand = 2 and schrikkeljaar = '1' then maxDag <= x"29"; -- Februari schrikkeljaar
		elsif huidigMaand = 2 then maxDag <= x"28"; -- februari geen schrikkeljaar
		elsif huidigMaand = 4 or huidigMaand = 6 or huidigMaand = 9 or huidigMaand = 11 then --April Juni Spetember November 30 dagen
			maxDag <= x"30";
		else maxDag <= x"31"; -- Rest van het jaar 31 dagen
		end if;
	end process;
end Behavioral;


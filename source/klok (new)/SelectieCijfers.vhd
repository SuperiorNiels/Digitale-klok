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
			  blkclk : in STD_LOGIC;	
			  idig : in  STD_LOGIC_VECTOR (23 downto 0);
           istate : in  STD_LOGIC_VECTOR (7 downto 0);
           odig1 : out  STD_LOGIC_VECTOR (3 downto 0);
           odig2 : out  STD_LOGIC_VECTOR (3 downto 0);
           odig3 : out  STD_LOGIC_VECTOR (3 downto 0);
           odig4 : out  STD_LOGIC_VECTOR (3 downto 0));
end SelectieCijfers;

architecture Behavioral of SelectieCijfers is
signal knipperen : STD_LOGIC := '0';
begin
	BLANK:process(sysclk)
	begin
		if rising_edge(sysclk) then
			if blkclk = '1' then
				if knipperen = '0' then
					knipperen <= '1';
				elsif knipperen = '1' then
					knipperen <= '0';
				end if;
			end if;
		end if;
	end process;
	SELCIJFER:process(sysclk)
	begin
			if rising_edge(sysclk) then
				case istate is
					when "00000010" =>
						if knipperen = '1' then        --UU:MM Knipperen uren
							odig4 <= idig(23 downto 20);
							odig3 <= idig(19 downto 16);
							odig2 <= idig(15 downto 12);
							odig1 <= idig(11 downto 8);
						else
							odig4 <= "1111";
							odig3 <= "1111";
							odig2 <= idig(15 downto 12);
							odig1 <= idig(11 downto 8);
						end if;
					when "00000100" =>
						if knipperen = '1' then        --UU:MM Knipperen minuten
							odig4 <= idig(23 downto 20);
							odig3 <= idig(19 downto 16);
							odig2 <= idig(15 downto 12);
							odig1 <= idig(11 downto 8);
						else
							odig4 <= idig(23 downto 20);
							odig3 <= idig(19 downto 16);
							odig2 <= "1111";
							odig1 <= "1111";
						end if;
					when "00001000" =>
						if knipperen = '1' then        --:SS Knipperen seconden
							odig4 <= "1110";
							odig3 <= "1110";
							odig2 <= idig(7 downto 4);
							odig1 <= idig(3 downto 0);
						else
							odig4 <= "1110";
							odig3 <= "1110";
							odig2 <= "1111";
							odig1 <= "1111";
						end if;
					when "00100000" =>
						if knipperen = '1' then			 --:JJ Knipperen jaren
							odig4 <= "1110";
							odig3 <= "1110";
							odig2 <= idig(23 downto 20);
							odig1 <= idig(19 downto 16);
						else
							odig4 <= "1110";
							odig3 <= "1110";
							odig2 <= "1111";
							odig1 <= "1111";
						end if;
					when "01000000" => 				 --DD:MM knipperen maandan
						if knipperen = '1' then
							odig4 <= idig(7 downto 4);
							odig3 <= idig(3 downto 0);
							odig2 <= idig(15 downto 12);
							odig1 <= idig(11 downto 8);
						else
							odig4 <= idig(7 downto 4);
							odig3 <= idig(3 downto 0);
							odig2 <= "1111";
							odig1 <= "1111";
						end if;
					when "10000000" => 				 --DD:MM knipperen dagen
						if knipperen = '1' then
							odig4 <= idig(7 downto 4);
							odig3 <= idig(3 downto 0);
							odig2 <= idig(15 downto 12);
							odig1 <= idig(11 downto 8);
						else
							odig4 <= "1111";
							odig3 <= "1111";
							odig2 <= idig(15 downto 12);
							odig1 <= idig(11 downto 8);
						end if;
					when "00010000" => 				 --DD:MM
						odig4 <= idig(7 downto 4);
						odig3 <= idig(3 downto 0);
						odig2 <= idig(15 downto 12);
						odig1 <= idig(11 downto 8);
					when others => 					 --UU:MM						
						odig4 <= idig(23 downto 20);
						odig3 <= idig(19 downto 16);
						odig2 <= idig(15 downto 12);
						odig1 <= idig(11 downto 8);
				end case;
			end if;
	end process;
end Behavioral;

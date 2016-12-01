----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:06:09 12/01/2016 
-- Design Name: 
-- Module Name:    Functie_Select - Behavioral 
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

entity Functie_Select is
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           in3 : in  STD_LOGIC;
           in4 : in  STD_LOGIC;
           in5 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           klok_1 : out  STD_LOGIC;
           klok_2 : out  STD_LOGIC;
           klok_3 : out  STD_LOGIC;
           klok_4 : out  STD_LOGIC;
           klok_5 : out  STD_LOGIC;
			  chrono_1 : out  STD_LOGIC;
           chrono_2 : out  STD_LOGIC;
           chrono_3 : out  STD_LOGIC;
           chrono_4 : out  STD_LOGIC;
           chrono_5 : out  STD_LOGIC;
           os2 : out  STD_LOGIC);
end Functie_Select;

architecture Behavioral of Functie_Select is
begin
	OUTPUTS: process(sysclk)
	begin
		if rising_edge(sysclk) then
			case s1 is
					when '0' =>
						klok_1 <= in1;
						klok_2 <= in2;
						klok_3 <= in3;
						klok_4 <= in4;
						klok_5 <= in5;
						chrono_1 <= '0';
						chrono_2 <= '0';
						chrono_3 <= '0';
						chrono_4 <= '0';
						chrono_5 <= '0';
						os2 <= '0';
					when '1' =>
						chrono_1 <= in1;
						chrono_2 <= in2;
						chrono_3 <= in3;
						chrono_4 <= in4;
						chrono_5 <= in5;
						klok_1 <= '0';
						klok_2 <= '0';
						klok_3 <= '0';
						klok_4 <= '0';
						klok_5 <= '0';
						os2 <= s2;
					when others =>
						klok_1 <= '0';
						klok_2 <= '0';
						klok_3 <= '0';
						klok_4 <= '0';
						klok_5 <= '0';
						chrono_1 <= '0';
						chrono_2 <= '0';
						chrono_3 <= '0';
						chrono_4 <= '0';
						chrono_5 <= '0';
						os2 <= '0';
			end case;
		end if;
	end process;
end Behavioral;
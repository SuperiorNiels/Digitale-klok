----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:06 04/06/2016 
-- Design Name: 
-- Module Name:    Control - Behavioral 
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

entity Control is
    Port ( dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig1 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig2 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig3 : in  STD_LOGIC_VECTOR (3 downto 0);
           en : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           bcdout : out  STD_LOGIC_VECTOR (3 downto 0);
           dignrout : out  STD_LOGIC_VECTOR (3 downto 0));
end Control;

architecture Behavioral of Control is
	signal dignr_int : integer range 0 to 3 := 0;
begin		
	DIGNR: process (sysclk,en) 
		begin if en = '1' then 
			if rising_edge(sysclk) then 
				if dignr_int = 3 then dignr_int <= 0; 
				else dignr_int <= dignr_int + 1; 
				end if; 
			else null; 
			end if; 
		end if; 
	end process; 
	MUX: process (dignr_int,dig3,dig2,dig1,dig0) 
		begin 
		case dignr_int is 
			when 0 => bcdout <= dig0; 
			when 1 => bcdout <= dig1; 
			when 2 => bcdout <= dig2; 
			when 3 => bcdout <= dig3; 
		end case; 
	end process; 
	DIGSELECT: process (dignr_int) 
		begin 
			case dignr_int is 
				when 0 => dignrout <= "1110";
				when 1 => dignrout <= "1101"; 
				when 2 => dignrout <= "1011"; 
				when 3 => dignrout <= "0111"; 
end case; 
end process;

end Behavioral;
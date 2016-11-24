----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:14:42 11/24/2016 
-- Design Name: 
-- Module Name:    blank_module - Behavioral 
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

entity blank_module is
    Port ( istate : in  STD_LOGIC_VECTOR (7 downto 0);
			  sysclk : in STD_LOGIC;
           blank0 : out  STD_LOGIC;
           blank1 : out  STD_LOGIC);
end blank_module;

architecture Behavioral of blank_module is

begin
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			case istate is
				when "00000001" =>
					blank0 <= '0';
					blank1 <= '0';
				when "00000010" =>
					blank0 <= '1';
					blank1 <= '0';
				when "00000100" =>
					blank0 <= '0';
					blank1 <= '1';
				when "00001000" =>
					blank0 <= '0';
					blank1 <= '1';
				when "00010000" =>
					blank0 <= '0';
					blank1 <= '0';
				when "00100000" =>
					blank0 <= '0';
					blank1 <= '1';
				when "01000000" =>
					blank0 <= '0';
					blank1 <= '1';
				when "10000000" =>
					blank0 <= '1';
					blank1 <= '0';
				when others =>
					blank0 <= '0';
					blank1 <= '0';	
			end case;
		end if;
	end process;

end Behavioral;


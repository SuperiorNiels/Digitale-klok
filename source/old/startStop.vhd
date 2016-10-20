----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:01 03/31/2016 
-- Design Name: 
-- Module Name:    Start-Stop - Behavioral 
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

entity startStop is
    Port ( start : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           sigl : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           sigO : out  STD_LOGIC);
end startStop;

architecture Behavioral of startStop is
signal doorsturen : std_logic := '0';
begin
	startStop : process (sysclk,start,stop)
		begin
			if rising_edge(sysclk) then
				if start = '1' then
					doorsturen <= '1';
				end if;
				if stop = '1' or reset = '1' then
					doorsturen <= '0';
				end if;
			end if;
		end process;
	sigO <= sigl when doorsturen = '1' else '0';
end Behavioral;


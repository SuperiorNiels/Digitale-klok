----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:51:49 02/23/2016 
-- Design Name: 
-- Module Name:    deler - Behavioral 
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

entity deler is
	Generic (div : integer := 10);
    Port ( sysclk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           pulse : out  STD_LOGIC);
end deler;

architecture Behavioral of deler is
	signal cnt_int : integer range 0 to div;
	constant max : integer := div - 1;
begin
	deler : process (sysclk)
		begin
			if rising_edge(sysclk) then
			if en = '1' then
				if cnt_int = max then cnt_int <= 0;
				else cnt_int <= cnt_int + 1;
				end if;
			end if;
		end if;
	end process;
	pulse <= '1' when ((cnt_int = max) and (en = '1')) else '0';
end Behavioral;


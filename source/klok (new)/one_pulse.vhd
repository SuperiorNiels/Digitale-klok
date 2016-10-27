----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:56:03 10/20/2016 
-- Design Name: 
-- Module Name:    one_pulse - Behavioral 
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

entity one_pulse is
    Port ( sysclk : in  STD_LOGIC;
           inp : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end one_pulse;


ARCHITECTURE behavioral of one_pulse is
signal delay1, delay2, delay3: STD_LOGIC;
begin
	process(sysclk)
		begin
		if rising_edge(sysclk) then
			delay1 <= inp;
			delay2 <= delay1;
			delay3 <= delay2;
		end if;
	end process;
	outp <= delay1 and delay2 and not delay3;
end Behavioral;	


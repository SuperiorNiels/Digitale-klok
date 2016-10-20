----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:39 10/19/2016 
-- Design Name: 
-- Module Name:    Debouncer - Behavioral 
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

entity Debouncer is
    Port ( inp : in  STD_LOGIC;
           debclk : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end Debouncer;

architecture Behavioral of Debouncer is
signal temp1, temp2, temp3 : STD_LOGIC;
begin
	process(debclk)
	begin
		if rising_edge(debclk) then
			temp1 <= inp;
			temp2 <= temp1;
			temp3 <= temp2;
		end if;
	end process;
	outp <= temp1 and temp2 and temp3;
end Behavioral;


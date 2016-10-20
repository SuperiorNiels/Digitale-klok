----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:07:52 10/20/2016 
-- Design Name: 
-- Module Name:    PrgTeller - Behavioral 
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

entity PrgTeller is
	Port (sysclk,cnten,reset 	: in  STD_LOGIC;
         min,max 					: in  STD_LOGIC_VECTOR (3 downto 0) ;
         count 					: out  STD_LOGIC_VECTOR (3 downto 0);
         tc 						: out  STD_LOGIC);
end PrgTeller;

architecture Behavioral of PrgTeller is
	signal count_sig 		: unsigned (3 downto 0);
begin
	process (sysclk)
	begin
		if rising_edge(sysclk) 	then 
			if (reset = '1') 	then 	count_sig <= unsigned(min);																
			elsif cnten ='1' then
				if (std_logic_vector(count_sig) = max) then count_sig <= unsigned(min);
				else	count_sig <= count_sig + 1;																
				end if;
			end if;
		end if;				
	end process;
	tc <= '1' when ((std_logic_vector(count_sig) = max) and (cnten = '1')) else '0';
	count <= std_logic_vector(count_sig);	
end Behavioral;


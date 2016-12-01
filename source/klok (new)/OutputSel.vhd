----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:13:26 12/01/2016 
-- Design Name: 
-- Module Name:    OutputSel - Behavioral 
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

entity OutputSel is
	Port (  sysclk : in STD_LOGIC;
			  cath_klok : in  STD_LOGIC_VECTOR (6 downto 0);
           an_klok : in  STD_LOGIC_VECTOR (3 downto 0);
           cath_chrono : in  STD_LOGIC_VECTOR (6 downto 0);
           an_chrono : in  STD_LOGIC_VECTOR (3 downto 0);
           sw1 : in  STD_LOGIC;
			  cath : out STD_LOGIC_VECTOR(6 downto 0);
			  an : out STD_LOGIC_VECTOR(3 downto 0));
end OutputSel;

architecture Behavioral of OutputSel is
begin
Sel_out : process(sysclk)
begin
	if rising_edge(sysclk) then
		if sw1 = '0' then
			cath <= cath_klok;
			an <= an_klok;
		elsif sw1 = '1' then
			cath <= cath_chrono;
			an <= an_chrono;
		end if;
	end if;
end process;
end Behavioral;


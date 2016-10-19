----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:57:08 03/31/2016 
-- Design Name: 
-- Module Name:    lap - Behavioral 
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

entity lap is
	Port (sysclk : in std_logic;
			d : in std_logic_vector (23 downto 0);
			lap_btn : in std_logic;
			cont_btn : in std_logic;
			q : out std_logic_vector (23 downto 0));
end lap;

architecture Behavioral of lap is
signal opslag : std_logic_vector (23 downto 0) := (others => '0');
signal actueel : std_logic := '1';
signal lapOn : std_logic := '0';
begin
	Save : process (sysclk,lap_btn,cont_btn)
		begin
			if rising_edge(sysclk) then
				if lap_btn = '1' and lapOn = '0' then
					actueel <= '0';
					opslag <= d;
					lapOn <= '1';
				elsif cont_btn = '1' then
					actueel <= '1';
					lapOn <= '0';
				end if;	
			end if;
		end process;
	q <= d when actueel = '1' else opslag;
end Behavioral;


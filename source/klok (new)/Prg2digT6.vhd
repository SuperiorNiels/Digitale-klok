----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
-- 
-- Create Date:    08:42:22 10/27/2016 
-- Design Name: 
-- Module Name:    Prg2digT3 - Behavioral 
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

entity Prg2digT3 is
	 Generic(	min1,min2,min3 : std_logic_vector(7 downto 0) := x"00";
				   max1,max2,max3 : std_logic_vector(7 downto 0) := x"99");
    Port ( sysclk : in  STD_LOGIC;
           cnten1 : in  STD_LOGIC;
			  cnten2 : in  STD_LOGIC;
			  cnten3 : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           updwn1 : in  STD_LOGIC;
			  updwn2 : in  STD_LOGIC;
			  updwn3 : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (23 downto 0);
           tc1 : inout  STD_LOGIC;
			  tc2 : inout  STD_LOGIC;
			  tc3 : inout  STD_LOGIC);
end Prg2digT3;

architecture Behavioral of Prg2digT3 is
	Component PrgTeller2dig
		Generic (bcd_min		:	std_logic_vector(7 downto 0):= x"00";
					bcd_max		:	std_logic_vector(7 downto 0):= x"99");
		port (cnten			:	in  std_logic;
				updwn			:	in  std_logic := '1';
				reset 		: 	in  std_logic;
				sysclk 		: 	in  std_logic;
				bcd_cnt		:	out std_logic_vector(7 downto 0);
				tc 			:	out std_logic);
		end component;
		--interne signalen
		signal tcT1CntenT2 : std_logic := '0';
		signal tcT2CntenT3 : std_logic := '0';
begin
	T1 : PrgTeller2dig
		Generic map(bcd_min => min1,
						bcd_max => max1)
		Port map(sysclk => sysclk,
					cnten => cnten1,
					updwn => updwn1,
					reset => reset,
					bcd_cnt => count(7 downto 0),
					tc => tc1);
	
	T2 : PrgTeller2dig
		Generic map(bcd_min => min2,
						bcd_max => max2)
		Port map(sysclk => sysclk,
					cnten => cnten2 or tc1,
					updwn => updwn2,
					reset => reset,
					bcd_cnt => count(15 downto 8),
					tc => tc2);
					
	T3 : PrgTeller2dig
		Generic map(bcd_min => min3,
						bcd_max => max3)
		Port map(sysclk => sysclk,
					cnten => cnten3 or tc2,
					updwn => updwn3,
					reset => reset,
					bcd_cnt => count(23 downto 16),
					tc => tc3);
					
end Behavioral;


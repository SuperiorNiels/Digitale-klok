----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter - Niels Balemans
-- 
-- Create Date:    20:21:53 10/20/2016 
-- Design Name: 
-- Module Name:    PrgT6 - Behavioral 
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

entity PrgT6 is
	Generic(min1,min2,min3,min4,min5,min6 : std_logic_vector(3 downto 0) := "0000";
			  max1,max2,max3,max4,max5,max6 : std_logic_vector(3 downto 0) := "1001");
    Port ( sysclk : in  STD_LOGIC;
           cnten : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  updwn : in STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (23 downto 0);
           tc : out  STD_LOGIC);
end PrgT6;

architecture Behavioral of PrgT6 is
	Component PrgTeller
		Generic(min :  STD_LOGIC_VECTOR (3 downto 0) := x"0";
				  max :  STD_LOGIC_VECTOR (3 downto 0) := x"9");
		Port (sysclk,cnten,reset 	: in  STD_LOGIC;
	 			updwn						: in 	STD_LOGIC := '1';
				count 					: out  STD_LOGIC_VECTOR (3 downto 0);
				tc 						: out  STD_LOGIC);
	end component;
	
	--Signals
	signal tcT1CntenT2 : std_logic := '0';
	signal tcT2CntenT3 : std_logic := '0';
	signal tcT3CntenT4 : std_logic := '0';
	signal tcT4CntenT5 : std_logic := '0';
	signal tcT5CntenT6 : std_logic := '0';
begin
	T1 : PrgTeller 
	Generic map (min => min1,
					 max => max1)
	Port map(sysclk => sysclk,
				cnten => cnten,
				reset => reset,
				updwn => updwn,
				count => count(3 downto 0),
				tc => tcT1CntenT2);
				
	T2 : PrgTeller 
	Generic map (min => min2,
					 max => max2)
	Port map(sysclk => sysclk,
				cnten => tcT1CntenT2,
				reset => reset,
				updwn => updwn,
				count => count(7 downto 4),
				tc => tcT2CntenT3);
				
	T3 : PrgTeller 
	Generic map (min => min3,
					 max => max3)
	Port map(sysclk => sysclk,
				cnten => tcT2CntenT3,
				reset => reset,
				updwn => updwn,
				count => count(11 downto 8),
				tc => tcT3CntenT4);
	
	T4 : PrgTeller 
	Generic map (min => min4,
	             max => max4)
	Port map(sysclk => sysclk,
				cnten => tcT3CntenT4,
				reset => reset,
				updwn => updwn,
				count => count(15 downto 12),
				tc => tcT4CntenT5);
				
	T5 : PrgTeller 
	Generic map (min => min5,
					 max => max5)
	Port map(sysclk => sysclk,
				cnten => tcT4CntenT5,
				reset => reset,
				updwn => updwn,
				count => count(19 downto 16),
				tc => tcT5CntenT6);
				
	T6 : PrgTeller 
	Generic map (min => min6,
				    max => max6)
	Port map(sysclk => sysclk,
				cnten => tcT5CntenT6,
				reset => reset,
				updwn => updwn,
				count => count(23 downto 20),
				tc => tc);	


end Behavioral;


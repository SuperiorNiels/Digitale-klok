----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
-- 
-- Create Date:    09:22:53 10/27/2016 
-- Design Name: 
-- Module Name:    TijdModule - Behavioral 
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
use ieee.numeric_std.all;

entity TijdModule is
    Port ( sysclk : in  STD_LOGIC;
           cnten : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           decr : in  STD_LOGIC;
           count : inout  STD_LOGIC_VECTOR (23 downto 0);
           ostate : out  STD_LOGIC_VECTOR (3 downto 0);
			  tc : out STD_LOGIC);
end TijdModule;

architecture Behavioral of TijdModule is
	Component Prg2digT3
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
           tc : out  STD_LOGIC);
	end component;
	
	Component ModeFSM
		Port ( sysclk : in  STD_LOGIC;
				mode : in  STD_LOGIC;
				incr : in  STD_LOGIC;
				decr : in  STD_LOGIC;
				cnten1 : out STD_LOGIC;
				updwn1 : out STD_LOGIC;
				cnten2 : out STD_LOGIC;
				updwn2 : out STD_LOGIC;
				cnten3 : out STD_LOGIC;
				updwn3 : out STD_LOGIC;
				ostate : out  STD_LOGIC_VECTOR (3 downto 0));
		end component;
	
	--Signals
	signal min1 : std_logic_vector(7 downto 0) := x"00";
	signal min2 : std_logic_vector(7 downto 0) := x"00";
	signal min3 : std_logic_vector(7 downto 0) := x"00";
	signal max1 : std_logic_vector(7 downto 0) := x"59";
	signal max2 : std_logic_vector(7 downto 0) := x"59";
	signal max3 : std_logic_vector(7 downto 0) := x"23";
	signal ud1  : std_logic := '1';
	signal ud2  : std_logic := '1';
	signal ud3  : std_logic := '1';
	signal en1  : std_logic := '0';
	signal en2  : std_logic := '0';
	signal en3  : std_logic := '0';
	
begin
	FSM : ModeFSM
	Port map(sysclk => sysclk,
				mode => mode,
				incr => incr,
				decr => decr,
				cnten1 => en1,
				updwn1 => ud1,
				cnten2 => en2,
				updwn2 => ud2,
				cnten3 => en3,
				updwn3 => ud3,
				ostate => ostate);
				
	Teller: Prg2digT3
	Generic map(min1=>min1, min2=>min2, min3=>min3, max1=>max1, max2=>max2, max3=>max3)
	Port map(sysclk => sysclk,
				reset => '0',
				cnten1 => cnten or en1,
				updwn1 => ud1,
				cnten2 => en2,
				updwn2 => ud2,
				cnten3 => en3,
				updwn3 => ud3,
				count => count,
				tc => tc);
				
				
end Behavioral;


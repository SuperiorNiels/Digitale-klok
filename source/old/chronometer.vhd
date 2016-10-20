----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:17:33 03/31/2016 
-- Design Name: 
-- Module Name:    chronometer - Behavioral 
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

entity chronometer is
    Port ( en : in  STD_LOGIC;
           start : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           lap_btn : in  STD_LOGIC;
           cont_btn : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           cath : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end chronometer;

architecture Behavioral of chronometer is
	Component deler
		Generic (div : integer := 10);
		Port ( sysclk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           pulse : out  STD_LOGIC);
	end component;
	
	Component startStop
		Port ( start : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           sigl : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           sigO : out  STD_LOGIC);
	end component;
	
	Component T6
		Generic (maxT1,maxT2,maxT3,maxT4,maxT5,maxT6 : integer := 10);
		Port ( sysclk : in std_logic;
				cnten : in std_logic;
				reset : in std_logic;
				count : out std_logic_vector (23 downto 0);
				tc : out std_logic);
	end component;
	
	Component lap
		Port (sysclk : in std_logic;
			d : in std_logic_vector (23 downto 0);
			lap_btn : in std_logic;
			cont_btn : in std_logic;
			q : out std_logic_vector (23 downto 0));
	end component;
	
	Component selWeergave
		Port ( sel : in  STD_LOGIC;
           digI : in  STD_LOGIC_VECTOR (23 downto 0);
           digO : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	Component weergave4dig7segm is
    Port ( dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig1 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig2 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig3 : in  STD_LOGIC_VECTOR (3 downto 0);
           sysclk : in  STD_LOGIC;
			  en : in  STD_LOGIC;
           cath : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	-- Parameters
	constant div1 : integer := 10;
	constant div2 : integer := 10;
	constant maxT1 : integer := 9;
	constant maxT2 : integer := 9;
	constant maxT3 : integer := 9;
	constant maxT4 : integer := 5;
	constant maxT5 : integer := 9;
	constant maxT6 : integer := 5;
	
	-- Signals
	signal sigl : std_logic := '0';
	signal startNaarD2 : std_logic := '0';
	signal cntenT6 : std_logic := '0';
	signal T6naarLap : std_logic_vector (23 downto 0) := (others => '0');
	signal LapOut : std_logic_vector (23 downto 0) := (others => '0');
	signal dig0_int,dig1_int,dig2_int,dig3_int : std_logic_vector (3 downto 0) := (others => '0');
begin
	D1 : deler 	Generic map (div=>div1)
					Port map (sysclk=>sysclk,en=>en,pulse=>sigl);
					
	S : startStop Port map (sysclk=>sysclk,sigl=>sigl,start=>start,
										stop=>stop,reset=>reset,sigO=>startNaarD2);
										
	D2 : deler 	Generic map (div=>div2)
					Port map (sysclk=>sysclk,en=>startNaarD2,pulse=>cntenT6);

	T6teller : T6 	Generic map (maxT1=>maxT1,maxT2=>maxT2,maxT3=>maxT3,maxT4=>maxT4,maxT5=>maxT5,maxT6=>maxT6)
				Port map (sysclk=>sysclk,cnten=>cntenT6,reset=>reset,count=>T6naarLap);
				
	L : lap Port map (sysclk=>sysclk,lap_btn=>lap_btn,cont_btn=>cont_btn,
							d=>T6naarLap,q=>LapOut);
							
	W : selWeergave Port map (digI=>LapOut,sel=>sel,digO(3 downto 0)=>dig0_int(3 downto 0),
										digO(7 downto 4)=>dig1_int(3 downto 0),digO(11 downto 8)=>dig2_int(3 downto 0),
										digO(15 downto 12)=>dig3_int(3 downto 0));
										
	WG : weergave4dig7segm Port map (dig0(3 downto 0)=>dig0_int(3 downto 0),dig1(3 downto 0)=>dig1_int(3 downto 0),
									dig2(3 downto 0)=>dig2_int(3 downto 0),dig3(3 downto 0)=>dig3_int(3 downto 0),
									cath=>cath,an=>an,en=>sigl,sysclk=>sysclk);
end Behavioral;


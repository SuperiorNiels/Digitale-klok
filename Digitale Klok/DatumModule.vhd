----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
-- 
-- Create Date:    10:48:35 11/16/2016 
-- Design Name: 
-- Module Name:    DatumModule - Behavioral 
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

entity DatumModule is
    Port ( sysclk : in  STD_LOGIC;
           cnten : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           decr : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           ocount : out  STD_LOGIC_VECTOR (23 downto 0);
           ostate : out  STD_LOGIC_VECTOR (3 downto 0));
end DatumModule;

architecture Behavioral of DatumModule is
	Component Prg2digT3

		Port (  min1,min2,min3 : in std_logic_vector(7 downto 0);
				  max1,max2,max3 : in std_logic_vector(7 downto 0);
				  reset1,reset2,reset3 : in std_logic := '0';
				  sysclk : in  STD_LOGIC;
			     cnten1 : in  STD_LOGIC;
				  cnten2 : in  STD_LOGIC;
				  cnten3 : in  STD_LOGIC;
				  updwn1 : in  STD_LOGIC;
				  updwn2 : in  STD_LOGIC;
				  updwn3 : in  STD_LOGIC;
				  count : out  STD_LOGIC_VECTOR (23 downto 0);
				  tc1 : out  STD_LOGIC;
				  tc2 : out  STD_LOGIC;
				  tc3 : out  STD_LOGIC);
	end component;
	
	Component ModeFSM
		Port ( sysclk : in  STD_LOGIC;
				mode : in  STD_LOGIC;
				incr : in  STD_LOGIC;
				decr : in  STD_LOGIC;
				reset : in STD_LOGIC;
				oweergave : out STD_LOGIC;
				cnten1 : out STD_LOGIC;
				updwn1 : out STD_LOGIC;
				cnten2 : out STD_LOGIC;
				updwn2 : out STD_LOGIC;
				cnten3 : out STD_LOGIC;
				updwn3 : out STD_LOGIC;
				ostate : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	Component DatumControl
		Port ( count : in  STD_LOGIC_VECTOR (23 downto 0);
			    sysclk : in STD_LOGIC;
             maxDag : out  STD_LOGIC_vector); -- max dag
	end component;
	
	constant min1 : std_logic_vector(7 downto 0) := x"01";
	constant min2 : std_logic_vector(7 downto 0) := x"01";
	constant min3 : std_logic_vector(7 downto 0) := x"15";
	constant max2 : std_logic_vector(7 downto 0) := x"12";
	constant max3 : std_logic_vector(7 downto 0) := x"99";
	
	--Signalen intern en generic aansturen
	signal max1 : std_logic_vector(7 downto 0) := x"30";
	signal ud1  : std_logic := '1';
	signal ud2  : std_logic := '1';
	signal ud3  : std_logic := '1';
	signal en1  : std_logic := '0';
	signal en2  : std_logic := '0';
	signal en3  : std_logic := '0';
	signal enT  : std_logic := '0';
	signal tc1Cnten2 : std_logic := '0';
	signal tc2Cnten3 : std_logic := '0';
	signal weergave : std_logic := '0';
	signal interne_count : std_logic_vector(23 downto 0) := x"000000";
	signal temp1: STD_LOGIC := '0';
	signal temp2: STD_LOGIC := '0';
	signal temp3: STD_LOGIC := '0';
	signal temp4 : std_logic := '0';	
begin
	waardes : process(cnten,weergave,en1,en2,en3,tc1Cnten2,tc2Cnten3)
	begin
		temp1 <= (cnten and weergave) or en1; --Cnten voor DD
		temp2 <= en2 or (tc1Cnten2 and weergave); --Cnten voor MM
		temp3 <= en3 or (tc2Cnten3 and weergave); --Cnten voor JJ
		temp4 <= en2 or en3; -- DD reset voor instellen
	end process;

	FSM : ModeFSM
	Port map(sysclk => sysclk,
				mode => mode,
				incr => incr,
				decr => decr,
				reset => reset,
				oweergave => weergave,
				cnten1 => en1,
				updwn1 => ud1,
				cnten2 => en2,
				updwn2 => ud2,
				cnten3 => en3,
				updwn3 => ud3,
				ostate => ostate);
	DC : DatumControl
	Port map( count => interne_count,
				 sysclk => sysclk,
				 maxDag => max1);			
	Teller : Prg2digT3
	Port map(min1=>min1,
				min2=>min2,
				min3=>min3,
				max1=>max1,
				max2=>max2,
				max3=>max3,
				reset1 => temp4,
				sysclk => sysclk,
				cnten1 => temp1,
				updwn1 => ud1,
				cnten2 => temp2,
				updwn2 => ud2,
				cnten3 => temp3,
				updwn3 => ud3,
				count => interne_count,
				tc1 => tc1Cnten2,
				tc2 => tc2Cnten3);
				
 --Uitgangssignaal count
 ocount <= interne_count;

end Behavioral;


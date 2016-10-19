----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:48 10/19/2016 
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

entity T6 is
	Generic (maxT1,maxT2,maxT3,maxT4,maxT5,maxT6 : integer := 10);
	Port ( sysclk : in std_logic;
			cnten : in std_logic;
			reset : in std_logic;
			count : out std_logic_vector (23 downto 0);
			tc : out std_logic);
end T6;

architecture Behavioral of T6 is
	Component teller
		Generic (max : integer := 10);
		Port ( sysclk : in  STD_LOGIC;
				  cnten : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  count : out  STD_LOGIC_VECTOR (3 downto 0);
				  tc : out  STD_LOGIC);
	End component;
	-- Signals
	signal tcT1CntenT2 : std_logic := '0';
	signal tcT2CntenT3 : std_logic := '0';
	signal tcT3CntenT4 : std_logic := '0';
	signal tcT4CntenT5 : std_logic := '0';
	signal tcT5CntenT6 : std_logic := '0';
	
begin
	T1 : teller Generic map (max=>maxT1)
					Port map (sysclk=>sysclk,cnten=>cnten,reset=>reset,count=>count(3 downto 0),tc=>tcT1CntenT2);
					
	T2 : teller Generic map (max=>maxT2)
					Port map (sysclk=>sysclk,cnten=>tcT1CntenT2,reset=>reset,count=>count(7 downto 4),tc=>tcT2CntenT3);
					
	T3 : teller Generic map (max=>maxT3)
					Port map (sysclk=>sysclk,cnten=>tcT2CntenT3,reset=>reset,count=>count(11 downto 8),tc=>tcT3CntenT4);
					
	T4 : teller Generic map (max=>maxT4)
					Port map (sysclk=>sysclk,cnten=>tcT3CntenT4,reset=>reset,count=>count(15 downto 12),tc=>tcT4CntenT5);
				
	T5 : teller Generic map (max=>maxT5)
					Port map (sysclk=>sysclk,cnten=>tcT4CntenT5,reset=>reset,count=>count(19 downto 16),tc=>tcT5CntenT6);
					
	T6 : teller Generic map (max=>maxT6)
					Port map (sysclk=>sysclk,cnten=>tcT5CntenT6,reset=>reset,count=>count(23 downto 20),tc=>tc);

end Behavioral;


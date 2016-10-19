----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:57 10/19/2016 
-- Design Name: 
-- Module Name:    Timing - Behavioral 
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

entity Timing is
    Port ( sysclk : in  STD_LOGIC;
           pulse1 : out STD_LOGIC;
           pulse2 : out STD_LOGIC;
           pulse3 : out STD_LOGIC;
           pulse4 : out STD_LOGIC);
end Timing;

architecture Behavioral of Timing is

--Componenten
	Component deler
	generic (div : integer := 10);
	port(
		sysclk,en		: in STD_LOGIC;
		pulse 			: out STD_LOGIC);
	end component;
	
--Signals
	constant divD1 : integer:= 1; --1000000 = 1ms
	constant divD2 : integer:= 10; --10000000 = 10ms
	constant divD3 : integer:= 100; --100000000 = 100ms
	constant divD4 : integer:= 1000; --1000000000 = 1sec
	
begin
	D1: deler GENERIC MAP(div => divD1)
		Port map(sysclk=>sysclk,
					en=>'1',
					pulse=>pulse1);
	D2: deler GENERIC MAP(div => divD2)
		Port map(sysclk=>sysclk,
					en=>'1',
					pulse=>pulse2);
	
	D3: deler GENERIC MAP(div => divD3)
		Port map(sysclk=>sysclk,
					en=>'1',
					pulse=>pulse3);
	
	D4: deler GENERIC MAP(div => divD4)
		Port map(sysclk=>sysclk,
					en=>'1',
					pulse=>pulse4);

end Behavioral;


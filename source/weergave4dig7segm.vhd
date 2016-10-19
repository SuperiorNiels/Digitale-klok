----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:20 03/08/2016 
-- Design Name: 
-- Module Name:    weergave4dig7segm - Behavioral 
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

entity weergave4dig7segm is
    Port ( dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig1 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig2 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig3 : in  STD_LOGIC_VECTOR (3 downto 0);
           sysclk : in  STD_LOGIC;
			  en : in  STD_LOGIC;
           cath : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end weergave4dig7segm;

architecture Behavioral of weergave4dig7segm is
	COMPONENT Control
		Port ( dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig1 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig2 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig3 : in  STD_LOGIC_VECTOR (3 downto 0);
           en : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           bcdout : out  STD_LOGIC_VECTOR (3 downto 0);
           dignrout : out  STD_LOGIC_VECTOR (3 downto 0));
	END COMPONENT;

	COMPONENT BCD7segmDec is
		Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           segm : out  STD_LOGIC_VECTOR (6 downto 0));
	END COMPONENT;
	signal bcdout_int : STD_LOGIC_VECTOR (3 downto 0);
begin
	C1:Control PORT MAP (sysclk=>sysclk,en=>en,
								dig3=>dig3,dig2=>dig2,dig1=>dig1,dig0=>dig0,
								bcdout=>bcdout_int,dignrout=>an);
	D1:BCD7segmDec PORT MAP (bcd=>bcdout_int,segm=>cath);
end Behavioral;


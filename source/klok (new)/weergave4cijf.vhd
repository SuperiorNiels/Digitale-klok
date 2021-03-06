----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:51:41 11/03/2016 
-- Design Name: 
-- Module Name:    weergave4cijf - Behavioral 
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

entity weergave4cijf is
    Port ( idig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           idig1 : in  STD_LOGIC_VECTOR (3 downto 0);
           idig2 : in  STD_LOGIC_VECTOR (3 downto 0);
           idig3 : in  STD_LOGIC_VECTOR (3 downto 0);
           cath : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           refrclk : in  STD_LOGIC);
           --sysclk : in  STD_LOGIC);
end weergave4cijf;

architecture Behavioral of weergave4cijf is
	component Control
		Port ( dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig1 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig2 : in  STD_LOGIC_VECTOR (3 downto 0);
           dig3 : in  STD_LOGIC_VECTOR (3 downto 0);
           en : in  STD_LOGIC;
           refrclk : in  STD_LOGIC;
           bcdout : out  STD_LOGIC_VECTOR (3 downto 0);
           dignrout : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	component BCD7segmDec is
		Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           segm : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	signal bcdout_int : STD_LOGIC_VECTOR (3 downto 0);
	signal en : STD_LOGIC := '1';
begin
	C1:Control PORT MAP (refrclk=>refrclk,en=>en,
								dig3=>idig3,dig2=>idig2,dig1=>idig1,dig0=>idig0,
								bcdout=>bcdout_int,dignrout=>an);
	D1: BCD7segmDec PORT MAP (bcd=>bcdout_int,segm=>cath);

end Behavioral;


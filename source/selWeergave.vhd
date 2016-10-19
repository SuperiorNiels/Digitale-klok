----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:15:02 03/31/2016 
-- Design Name: 
-- Module Name:    selWeergave - Behavioral 
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

entity selWeergave is
    Port ( sel : in  STD_LOGIC;
           digI : in  STD_LOGIC_VECTOR (23 downto 0);
           digO : out  STD_LOGIC_VECTOR (15 downto 0));
end selWeergave;

architecture Behavioral of selWeergave is
begin
	digO <= digI (15 downto 0) when sel = '0' else digI (23 downto 8);
end Behavioral;


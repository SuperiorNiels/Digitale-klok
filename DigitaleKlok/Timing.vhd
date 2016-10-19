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
           pulse4 : in  STD_LOGIC;
           pulse3 : in  STD_LOGIC;
           pulse2 : in  STD_LOGIC;
           pulse1 : in  STD_LOGIC);
end Timing;

architecture Behavioral of Timing is

begin


end Behavioral;


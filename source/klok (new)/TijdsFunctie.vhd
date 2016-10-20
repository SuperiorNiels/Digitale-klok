----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:24:47 10/20/2016 
-- Design Name: 
-- Module Name:    TijdsFunctie - Behavioral 
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

entity TijdsFunctie is
    Port ( mode : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           decr : in  STD_LOGIC;
			  sysclk : in  STD_LOGIC;
           cnten : in  STD_LOGIC;
           state : out  STD_LOGIC_VECTOR(1 downto 0);
           count : out  STD_LOGIC_VECTOR(23 downto 0);
			  tc	  : out STD_LOGIC);
			  
end TijdsFunctie;

architecture Behavioral of TijdsFunctie is

begin


end Behavioral;


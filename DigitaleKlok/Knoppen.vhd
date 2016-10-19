----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:26 10/19/2016 
-- Design Name: 
-- Module Name:    Knoppen - Behavioral 
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

entity Knoppen is
    Port ( btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           btn4 : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           debclk : in  STD_LOGIC;
           out1 : out  STD_LOGIC;
           out2 : out  STD_LOGIC;
           out3 : out  STD_LOGIC;
           out4 : out  STD_LOGIC);
end Knoppen;

architecture Behavioral of Knoppen is
Component Debouncer is
    Port ( inp : in  STD_LOGIC;
           debclk : in  STD_LOGIC;
			  sysclk : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end Component;
begin
	Deb1 : Debouncer Port map (inp=>btn1,debclk=>debclk,sysclk=>sysclk,outp=>out1);
	Deb2 : Debouncer Port map (inp=>btn2,debclk=>debclk,sysclk=>sysclk,outp=>out2);
	Deb3 : Debouncer Port map (inp=>btn3,debclk=>debclk,sysclk=>sysclk,outp=>out3);
	Deb4 : Debouncer Port map (inp=>btn4,debclk=>debclk,sysclk=>sysclk,outp=>out4);

end Behavioral;


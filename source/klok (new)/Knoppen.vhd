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
			  btn5 : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           debclk : in  STD_LOGIC;
           out1 : out  STD_LOGIC;
           out2 : out  STD_LOGIC;
           out3 : out  STD_LOGIC;
           out4 : out  STD_LOGIC;
			  out5 : out  STD_LOGIC);
end Knoppen;

architecture Behavioral of Knoppen is
Component Debouncer is
    Port ( inp : in  STD_LOGIC;
           debclk : in  STD_LOGIC;
			  sysclk : in STD_LOGIC;
           outp : out  STD_LOGIC);
end Component;
Component one_pulse is
    Port ( sysclk : in  STD_LOGIC;
           inp : in  STD_LOGIC;
           outp : out  STD_LOGIC);
end Component;
signal temp_out1, temp_out2, temp_out3, temp_out4, temp_out5 : STD_LOGIC := '0';
begin
	Deb1 : Debouncer Port map (inp=>btn1,debclk=>debclk,outp=>temp_out1,sysclk=>sysclk);
	Deb2 : Debouncer Port map (inp=>btn2,debclk=>debclk,outp=>temp_out2,sysclk=>sysclk);
	Deb3 : Debouncer Port map (inp=>btn3,debclk=>debclk,outp=>temp_out3,sysclk=>sysclk);
	Deb4 : Debouncer Port map (inp=>btn4,debclk=>debclk,outp=>temp_out4,sysclk=>sysclk);
	Deb5 : Debouncer Port map (inp=>btn5,debclk=>debclk,outp=>temp_out5,sysclk=>sysclk);
	
	O1 : one_pulse Port map (sysclk=>sysclk,inp=>temp_out1,outp=>out1);
	O2 : one_pulse Port map (sysclk=>sysclk,inp=>temp_out2,outp=>out2);
	O3 : one_pulse Port map (sysclk=>sysclk,inp=>temp_out3,outp=>out3);
	O4 : one_pulse Port map (sysclk=>sysclk,inp=>temp_out4,outp=>out4);
	O5 : one_pulse Port map (sysclk=>sysclk,inp=>temp_out5,outp=>out5);
end Behavioral;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:05:32 10/27/2016 
-- Design Name: 
-- Module Name:    Functie_select - Behavioral 
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

entity Functie_select is
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           in3 : in  STD_LOGIC;
           in4 : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           tijd_1 : out  STD_LOGIC;
           tijd_2 : out  STD_LOGIC;
           tijd_3 : out  STD_LOGIC;
           datum_1 : out  STD_LOGIC;
           datum_2 : out  STD_LOGIC;
           datum_3 : out  STD_LOGIC;
			  dis 	 : in   STD_LOGIC;
			  wekker_1 : out  STD_LOGIC;
           wekker_2 : out  STD_LOGIC;
           wekker_3 : out  STD_LOGIC);
end Functie_select;

architecture Behavioral of Functie_select is
type state is (tijd,datum,wekker);
signal present_state : state;
signal next_state : state;
begin
	STATE_REG: process(sysclk,dis)
	begin
		if rising_edge(sysclk) then
			present_state <= next_state;
		end if;
	end process;
	
	NXT_STATE: process(present_state,in4)
	begin
	if dis = '1' then next_state <= present_state;
	else
		case present_state is
			when tijd => if in4 = '1' then next_state <= datum; else next_state <= tijd; end if;
			when datum => if in4 = '1' then next_state <= wekker; else next_state <= datum; end if;
			when wekker => if in4 = '1' then next_state <= tijd; else next_state <= wekker; end if;	
		end case; 
	end if;
	end process;
	
	OUTPUTS: process(sysclk)
	begin
		if rising_edge(sysclk) then
			case present_state is
				when tijd =>
					if dis = '0' then
						tijd_1 <= in1;
						tijd_2 <= in2;
						tijd_3 <= in3;
						datum_1 <= '0';
						datum_2 <= '0';
						datum_3 <= '0';
						wekker_1 <= '0';
						wekker_2 <= '0';
						wekker_3 <= '0';
					else
						tijd_1 <= '0';
						tijd_2 <= '0';
						tijd_3 <= '0';
						datum_1 <= '0';
						datum_2 <= '0';
						datum_3 <= '0';
						wekker_1 <= '0';
						wekker_2 <= '0';
						wekker_3 <= '0';
					end if;
				when datum =>
					if dis = '0' then
						datum_1 <= in1;
						datum_2 <= in2;
						datum_3 <= in3;
						wekker_1 <= '0';
						wekker_2 <= '0';
						wekker_3 <= '0';
						tijd_1 <= '0';
						tijd_2 <= '0';
						tijd_3 <= '0';
					else 
						datum_1 <= '0';
						datum_2 <= '0';
						datum_3 <= '0';
						wekker_1 <= '0';
						wekker_2 <= '0';
						wekker_3 <= '0';
						tijd_1 <= '0';
						tijd_2 <= '0';
						tijd_3 <= '0';
					end if;
				when wekker =>
					if dis = '0' then
						wekker_1 <= in1;
						wekker_2 <= in2;
						wekker_3 <= in3;
						datum_1 <= '0';
						datum_2 <= '0';
						datum_3 <= '0';
						tijd_1 <= '0';
						tijd_2 <= '0';
						tijd_3 <= '0';
					else 
						wekker_1 <= '0';
						wekker_2 <= '0';
						wekker_3 <= '0';
						datum_1 <= '0';
						datum_2 <= '0';
						datum_3 <= '0';
						tijd_1 <= '0';
						tijd_2 <= '0';
						tijd_3 <= '0';
					end if;
			end case;
		end if;
	end process;
	
end Behavioral;


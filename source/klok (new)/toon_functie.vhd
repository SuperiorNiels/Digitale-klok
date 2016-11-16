----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:28:03 11/16/2016 
-- Design Name: 
-- Module Name:    toon_functie - Behavioral 
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

entity toon_functie is
    Port ( idig1 : in  STD_LOGIC_VECTOR (23 downto 0);
           idig2 : in  STD_LOGIC_VECTOR (23 downto 0);
           idig3 : in  STD_LOGIC_VECTOR (23 downto 0);
           istate1 : in  STD_LOGIC_VECTOR (3 downto 0);
           istate2 : in  STD_LOGIC_VECTOR (3 downto 0);
           istate3 : in  STD_LOGIC_VECTOR (3 downto 0);
           odig : out  STD_LOGIC_VECTOR (23 downto 0);
           ostate : out  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC;
			  sysclk : in STD_LOGIC);
end toon_functie;

architecture Behavioral of toon_functie is
type state is (tijd,datum,wekker);
signal present_state : state;
signal next_state : state;
begin
	STATE_REG: process(sysclk)
	begin
		if rising_edge(sysclk) then
			present_state <= next_state;
		end if;
	end process;
	
	NXT_STATE: process(present_state,sel)
	begin
		case present_state is
			when tijd => if sel = '1' then next_state <= datum; else next_state <= tijd; end if;
			when datum => if sel = '1' then next_state <= wekker; else next_state <= datum; end if;
			when wekker => if sel = '1' then next_state <= tijd; else next_state <= wekker; end if;
		end case;
	end process;
	OUTPUTS: process(sysclk)
	begin
		if rising_edge(sysclk) then
			case present_state is
				when tijd =>
					odig(23 downto 0) <= idig1(23 downto 0);
					ostate(3 downto 0) <= istate1(3 downto 0);
				when datum =>
					odig(23 downto 0) <= idig2(23 downto 0);
					ostate(3 downto 0) <= istate2(3 downto 0);
				when wekker =>
					odig(23 downto 0) <= idig3(23 downto 0);
					ostate(3 downto 0) <= istate3(3 downto 0);
			end case;
		end if;
	end process;
end Behavioral;


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
    Port ( sel : in  STD_LOGIC;
			  sysclk : in STD_LOGIC;
			  dis   : in STD_LOGIC;
			  idig1 : in  STD_LOGIC_VECTOR (23 downto 0);
           idig2 : in  STD_LOGIC_VECTOR (23 downto 0);
           idig3 : in  STD_LOGIC_VECTOR (23 downto 0);
           istate1 : in  STD_LOGIC_VECTOR (3 downto 0);
           istate2 : in  STD_LOGIC_VECTOR (3 downto 0);
           istate3 : in  STD_LOGIC_VECTOR (3 downto 0);
           odig : out  STD_LOGIC_VECTOR (23 downto 0);
           ostate : out  STD_LOGIC_VECTOR (7 downto 0);
			  led0 : out STD_LOGIC;
			  led1 : out STD_LOGIC;
			  led2 : out STD_LOGIC);
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
	if dis = '1' then next_state <= present_state;
	else
		case present_state is
			when tijd => if sel = '1' then next_state <= datum; else next_state <= tijd; end if;
			when datum => if sel = '1' then next_state <= wekker; else next_state <= datum; end if;
			when wekker => if sel = '1' then next_state <= tijd; else next_state <= wekker; end if;
		end case; 
	end if;
	end process;
	OUTPUTS: process(sysclk)
	begin
		if rising_edge(sysclk) then
			case present_state is
				when tijd =>
					odig(23 downto 0) <= idig1(23 downto 0);
					case istate1 is
						when "0001" => ostate <= "00000001"; led0 <= '1'; led1 <= '0'; led2 <= '0'; 
						when "0010" => ostate <= "00000010"; led0 <= '0'; led1 <= '0'; led2 <= '0';
						when "0100" => ostate <= "00000100"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
						when "1000" => ostate <= "00001000"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
						when others => ostate <= "00000000"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
					end case;
				when datum =>
					odig(23 downto 0) <= idig2(23 downto 0);
					case istate2 is
						when "0001" => ostate <= "00010000"; led0 <= '0'; led1 <= '1'; led2 <= '0'; 
						when "0010" => ostate <= "00100000"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
						when "0100" => ostate <= "01000000"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
						when "1000" => ostate <= "10000000"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
						when others => ostate <= "00000000"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
					end case;
				when wekker =>
					odig(23 downto 0) <= idig3(23 downto 0);
					case istate3 is
						when "0001" => ostate <= "00000001"; led0 <= '0'; led1 <= '0'; led2 <= '1'; 
						when "0010" => ostate <= "00000010"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
						when "0100" => ostate <= "00000100"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
						when "1000" => ostate <= "00001000"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
						when others => ostate <= "00000000"; led0 <= '0'; led1 <= '0'; led2 <= '0'; 
					end case;
			end case;
		end if;
	end process;	
end Behavioral;


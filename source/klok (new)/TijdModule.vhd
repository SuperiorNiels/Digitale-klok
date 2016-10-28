----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
-- 
-- Create Date:    09:22:53 10/27/2016 
-- Design Name: 
-- Module Name:    TijdModule - Behavioral 
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

entity TijdModule is
    Port ( sysclk : in  STD_LOGIC;
           cnten : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           decr : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (23 downto 0);
           state : out  STD_LOGIC_VECTOR (1 downto 0));
end TijdModule;

architecture Behavioral of TijdModule is
	Component Prg2digT3
	Generic(	min1,min2,min3 : std_logic_vector(7 downto 0) := x"00";
				max1,max2,max3 : std_logic_vector(7 downto 0) := x"99");
   Port( sysclk : in  STD_LOGIC;
           cnten : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           updwn : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (23 downto 0);
           tc : out  STD_LOGIC);
	end component;
	--Signals
	signal min1 : std_logic_vector(7 downto 0) := x"00";
	signal min2 : std_logic_vector(7 downto 0) := x"00";
	signal min3 : std_logic_vector(7 downto 0) := x"00";
	signal max1 : std_logic_vector(7 downto 0) := x"99";
	signal max2 : std_logic_vector(7 downto 0) := x"99";
	signal max3 : std_logic_vector(7 downto 0) := x"99";
	
	--State Machine States:
	type state(Tijdweergave,InstellenUU,IntellenMM,InstellenSS)
	signal present_state ,next_state : state;
begin
	STATE_REG : process (sysclk)
	begin
		if rising_edge(sysclk) then present_state <= next_state;
		end if;
	end process;
	
	NXT_STATE : process (present_state, mode)
	begin
		case present_state is
			when Tijdweergave => if mode = '1' then next_state <= InstellenUU; else next_state <= Tijdweergave; end if;
			when InstellenUU => if mode = '1' then next_state <= InstellenMM; else next_state <= InstellenUU; end if;	
			when InstellenMM => if mode = '1' then next_state <= InstellenSS; else next_state <= InstellenMM; end if;
			when InstellenSS => if mode = '1' then next_state <= Tijdweergave; else next_state <= InstellenSS; end if;
		end case;
	end process;
	
	OUTPUTS : process(sysclk,present_state)
	begin
		if rising_edge(sysclk) then
			case present_state is
				when Tijdweergave => cnten => '1';
			end case
		end if;
	end process;
	
	Teller: Prg2digT3
		Generic map(min1=>min1, min2=>min2, min3=>min3, max1=>max1, max2=>max2, max3=>max3)
		Port map
				
end Behavioral;


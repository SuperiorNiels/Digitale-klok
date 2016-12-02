----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:22:41 12/01/2016 
-- Design Name: 
-- Module Name:    Uurwerk - Behavioral 
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

entity Uurwerk is
    Port ( btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           btn4 : in  STD_LOGIC;
           btn5 : in  STD_LOGIC;
           sw1 : in  STD_LOGIC;
           sw2 : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           led0 : out  STD_LOGIC;
           led1 : out  STD_LOGIC;
           led2 : out  STD_LOGIC;
           led6 : out  STD_LOGIC;
           led7 : out  STD_LOGIC;
           cath : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end Uurwerk;

architecture Behavioral of Uurwerk is
	
component Functie_Sel
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           in3 : in  STD_LOGIC;
           in4 : in  STD_LOGIC;
           in5 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
           klok_1 : out  STD_LOGIC;
           klok_2 : out  STD_LOGIC;
           klok_3 : out  STD_LOGIC;
           klok_4 : out  STD_LOGIC;
           klok_5 : out  STD_LOGIC;
			  chrono_1 : out  STD_LOGIC;
           chrono_2 : out  STD_LOGIC;
           chrono_3 : out  STD_LOGIC;
           chrono_4 : out  STD_LOGIC;
           chrono_5 : out  STD_LOGIC;
           os2 : out  STD_LOGIC);
end component;

component chronometer
	Port (sysclk : in std_logic;
			reset  : in std_logic;
			start  : in std_logic;
			stop   : in std_logic;
			en     : in std_logic;
			lap_bt : in std_logic;
			cont_bt: in std_logic;
			sel    : in std_logic;
			cath   : out std_logic_vector(6 downto 0);
			an     : out std_logic_vector(3 downto 0));
end component;

component klok
    Port ( btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           btn4 : in  STD_LOGIC;
			  btns : in  STD_LOGIC;
           sysclk : in  STD_LOGIC;
			  cath : out STD_LOGIC_VECTOR(6 downto 0);
			  an : out STD_LOGIC_VECTOR(3 downto 0);
			  led0 : out STD_LOGIC;
			  led1 : out STD_LOGIC;
			  led2 : out STD_LOGIC;
			  led6 : out STD_LOGIC;
			  led7 : out STD_LOGIC);
end component;

component OutputSel
	Port (  sysclk : in STD_LOGIC;
			  cath_klok : in  STD_LOGIC_VECTOR (6 downto 0);
           an_klok : in  STD_LOGIC_VECTOR (3 downto 0);
           cath_chrono : in  STD_LOGIC_VECTOR (6 downto 0);
           an_chrono : in  STD_LOGIC_VECTOR (3 downto 0);
           sw1 : in  STD_LOGIC;
			  cath : out STD_LOGIC_VECTOR(6 downto 0);
			  an : out STD_LOGIC_VECTOR(3 downto 0));
end component;

--signals
signal klok_1_sign : std_logic := '0';
signal klok_2_sign : std_logic := '0';
signal klok_3_sign : std_logic := '0';
signal klok_4_sign : std_logic := '0';
signal klok_5_sign : std_logic := '0';

signal chrono_1_sign : std_logic := '0';
signal chrono_2_sign : std_logic := '0';
signal chrono_3_sign : std_logic := '0';
signal chrono_4_sign : std_logic := '0';
signal chrono_5_sign : std_logic := '0';

signal os2_sign : std_logic := '0';

signal cath_klok_sign : std_logic_vector(6 downto 0) := "0000000";
signal an_klok_sign : std_logic_vector(3 downto 0) := "0000";

signal cath_chrono_sign : std_logic_vector(6 downto 0) := "0000000";
signal an_chrono_sign : std_logic_vector(3 downto 0) := "0000";

begin

	FuncSel : Functie_Sel
	Port map (in1 => btn1,
				 in2 => btn2,
				 in3 => btn3,
				 in4 => btn4,
				 in5 => btn5,
				 s1 => sw1,
				 s2 => sw2,
				 sysclk => sysclk,
				 klok_1 => klok_1_sign,
				 klok_2 => klok_2_sign,
				 klok_3 => klok_3_sign,
				 klok_4 => klok_4_sign,
				 klok_5 => klok_5_sign,
				 chrono_1 => chrono_1_sign,
				 chrono_2 => chrono_2_sign,
				 chrono_3 => chrono_3_sign,
				 chrono_4 => chrono_4_sign,
				 chrono_5 => chrono_5_sign,
				 os2 => os2_sign);
				 
	K : klok
	Port map (btn1 => klok_1_sign,
				 btn2 => klok_2_sign,
				 btn3 => klok_3_sign,
				 btn4 => klok_4_sign,
				 btns => klok_5_sign,
				 sysclk => sysclk,
				 cath => cath_klok_sign,
				 an => an_klok_sign,
				 led0 => led0,
				 led1 => led1,
				 led2 => led2,
				 led6 => led6,
				 led7 => led7);
				 
	C : chronometer
	Port map (sysclk => sysclk,
				 reset => chrono_1_sign,
				 start => chrono_2_sign,
				 stop => chrono_3_sign,
				 lap_bt => chrono_4_sign,
				 cont_bt => chrono_5_sign,
				 sel => os2_sign,
				 en => '1',
				 cath => cath_chrono_sign,
				 an => an_chrono_sign);
				 
	OS : OutputSel
	Port map (sysclk => sysclk,
				 cath_klok => cath_klok_sign,
				 an_klok => an_klok_sign,
				 cath_chrono => cath_chrono_sign,
				 sw1 => sw1,
				 an_chrono => an_chrono_sign,
				 cath => cath,
				 an => an);

end Behavioral;


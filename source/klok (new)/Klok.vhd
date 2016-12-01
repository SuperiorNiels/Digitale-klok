----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:12 11/24/2016 
-- Design Name: 
-- Module Name:    klok - Behavioral 
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

entity klok is
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
end klok;

architecture Behavioral of klok is
	component Timing
		 Port ( sysclk : in  STD_LOGIC;
				  pulse1 : out STD_LOGIC;
				  pulse2 : out STD_LOGIC;
				  pulse3 : out STD_LOGIC;
				  pulse4 : out STD_LOGIC);
	end component;
	
	component Knoppen
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
	end component;
	
	component Functie_select
			 Port(in1 : in  STD_LOGIC;
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
				  dis     : in   STD_LOGIC;
				  wekker_1 : out  STD_LOGIC;
				  wekker_2 : out  STD_LOGIC;
				  wekker_3 : out  STD_LOGIC);
	end component;
	
	component TijdModule
			 Port(sysclk : in  STD_LOGIC;
				  cnten : in  STD_LOGIC;
				  mode : in  STD_LOGIC;
				  incr : in  STD_LOGIC;
				  decr : in  STD_LOGIC;
				  reset : in STD_LOGIC;
				  count : out  STD_LOGIC_VECTOR (23 downto 0);
				  ostate : out  STD_LOGIC_VECTOR (3 downto 0);
				  tc : out STD_LOGIC);
	end component;
	
	component DatumModule
			 Port ( sysclk : in  STD_LOGIC;
					  cnten : in  STD_LOGIC;
					  mode : in  STD_LOGIC;
					  incr : in  STD_LOGIC;
					  decr : in  STD_LOGIC;
					  reset : in STD_LOGIC;
					  ocount : out  STD_LOGIC_VECTOR (23 downto 0);
					  ostate : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component WekkerModule
			 Port ( sysclk : in  STD_LOGIC;
					  mode : in  STD_LOGIC;
					  incr : in  STD_LOGIC;
					  decr : in  STD_LOGIC;
					  reset : in STD_LOGIC;
					  count : out  STD_LOGIC_VECTOR (23 downto 0);
					  ostate : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	component toon_functie
			Port (  sel : in  STD_LOGIC;
					  sysclk : in STD_LOGIC;
					  dis : in STD_LOGIC;
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
	end component;
	
	component SelectieCijfers
			 Port ( sysclk : in STD_LOGIC;
				  idig : in  STD_LOGIC_VECTOR (23 downto 0);
				  istate : in  STD_LOGIC_VECTOR (7 downto 0);
				  odig1 : out  STD_LOGIC_VECTOR (3 downto 0);
				  odig2 : out  STD_LOGIC_VECTOR (3 downto 0);
				  odig3 : out  STD_LOGIC_VECTOR (3 downto 0);
				  odig4 : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component WekkerCheck
			 Port ( sysclk : in STD_LOGIC;
				  btns : in  STD_LOGIC;
				  digTijd : in  STD_LOGIC_VECTOR (23 downto 0);
				  digWekker : in  STD_LOGIC_VECTOR (23 downto 0);
				  dis  : out STD_LOGIC;
				  led6 : out  STD_LOGIC;
				  led7 : out  STD_LOGIC);
	end component;
		
	component weergave4dig7segm
				Port ( dig0 : in  STD_LOGIC_VECTOR (3 downto 0);
					  dig1 : in  STD_LOGIC_VECTOR (3 downto 0);
					  dig2 : in  STD_LOGIC_VECTOR (3 downto 0);
					  dig3 : in  STD_LOGIC_VECTOR (3 downto 0);
					  sysclk : in  STD_LOGIC;
					  en : in  STD_LOGIC;
					  cath : out  STD_LOGIC_VECTOR (6 downto 0);
					  an : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	--Interne Signalen
	signal pulse1_sign : std_logic := '0';
	signal pulse2_sign : std_logic := '0';
	signal pulse3_sign : std_logic := '0';
	signal pulse4_sign : std_logic := '0';
	
	signal out1_sign : std_logic := '0';
	signal out2_sign : std_logic := '0';
	signal out3_sign : std_logic := '0';
	signal out4_sign : std_logic := '0';
	signal outs_sign : std_logic := '0';
	
	signal tijd_mode : std_logic := '0';
	signal tijd_incr : std_logic := '0';
	signal tijd_decr : std_logic := '0';
	signal datum_mode : std_logic := '0';
	signal datum_incr : std_logic := '0';
	signal datum_decr : std_logic := '0';
	signal wekker_mode : std_logic := '0';
	signal wekker_incr : std_logic := '0';
	signal wekker_decr : std_logic := '0';
	signal dis_sign    : std_logic := '0';
	
	signal tijd_count : std_logic_vector(23 downto 0) := x"000000";
	signal tijd_state : std_logic_vector(3 downto 0) := "0000";
	signal tijdTcDatum : std_logic := '0';
	
	signal datum_count : std_logic_vector(23 downto 0) := x"000000";
	signal datum_state : std_logic_vector(3 downto 0) := "0000";
	
	signal wekker_count : std_logic_vector(23 downto 0) := x"000000";
	signal wekker_state : std_logic_vector(3 downto 0) := "0000";
	
	signal dig_sign : std_logic_vector(23 downto 0) := x"000000";
	signal state_sign : std_logic_vector(7 downto 0) := x"00";
	
	signal dig1_sign : std_logic_vector(3 downto 0) := "0000";
	signal dig2_sign : std_logic_vector(3 downto 0) := "0000";
	signal dig3_sign : std_logic_vector(3 downto 0) := "0000";
	signal dig4_sign : std_logic_vector(3 downto 0) := "0000";


begin
	
	T : Timing
	Port map(sysclk => sysclk,
				pulse1 => pulse1_sign,
				pulse2 => pulse2_sign,
				pulse3 => pulse3_sign,
				pulse4 => pulse4_sign);	
			
	K : Knoppen
	Port map(btn1 => btn1,
				btn2 => btn2,
				btn3 => btn3,
				btn4 => btn4,
				btn5 => btns,
				sysclk => sysclk,
				debclk => pulse2_sign,
				out1 => out1_sign,
				out2 => out2_sign,
				out3 => out3_sign,
				out4 => out4_sign,
				out5 => outs_sign);
				
	FS : Functie_Select
	Port map(in1 => out1_sign,
				in2 => out2_sign,
				in3 => out3_sign,
				in4 => out4_sign,
				sysclk => sysclk,
				tijd_1 => tijd_mode,
				tijd_2 => tijd_incr,
				tijd_3 => tijd_decr,
				datum_1 => datum_mode,
				datum_2 => datum_incr,
				datum_3 => datum_decr,
				dis => dis_sign,
				wekker_1 => wekker_mode,
				wekker_2 => wekker_incr,
				wekker_3 => wekker_decr);
				
	Tijd : TijdModule
	Port map(sysclk => sysclk,
				cnten => pulse4_sign,
				mode => tijd_mode,
				incr => tijd_incr,
				decr => tijd_decr,
				reset => out4_sign,
				count => tijd_count,
				ostate => tijd_state,
				tc => tijdTcDatum);
				
	Datum : DatumModule
	Port map(sysclk => sysclk,
				cnten => tijdTcDatum,
				mode => datum_mode,
				incr => datum_incr,
				decr => datum_decr,
				reset => out4_sign,
				ocount => datum_count,
				ostate => datum_state);
				
	Wekker : WekkerModule
	Port map(sysclk => sysclk,
				mode => wekker_mode,
				incr => wekker_incr,
				decr => wekker_decr,
				reset => out4_sign,
				count => wekker_count,
				ostate => wekker_state);
				
	TF : toon_functie
	Port map(sel => out4_sign,
				sysclk => sysclk,
				dis => dis_sign,
				idig1 => tijd_count,
				idig2 => datum_count,
				idig3 => wekker_count,
				istate1 => tijd_state,
				istate2 => datum_state,
				istate3 => wekker_state,
				odig => dig_sign,
				ostate => state_sign,
				led0 => led0,
				led1 => led1,
				led2 => led2);
				
	SC : SelectieCijfers
	Port map(sysclk => sysclk,
				idig => dig_sign,
				istate => state_sign,
				odig1 => dig1_sign,
				odig2 => dig2_sign,
				odig3 => dig3_sign,
				odig4 => dig4_sign);
				
	WC : WekkerCheck
	Port map(sysclk => sysclk,
				btns => outs_sign,
				digTijd => tijd_count,
				digWekker => wekker_count,
				dis => dis_sign,
				led6 => led6,
				led7 => led7);
				
	Weergave : weergave4dig7segm
	Port map(dig0 => dig1_sign,
				dig1 => dig2_sign,
				dig2 => dig3_sign,
				dig3 => dig4_sign,
			   sysclk => sysclk,
				en => pulse1_sign,
				cath => cath,
				an => an);
				
end Behavioral;


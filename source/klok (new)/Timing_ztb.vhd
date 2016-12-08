-- Company: 		
-- Engineer: 		
-- Create Date:	22:04:39 2016/12/08
-- Design Name:	klok
-- Module Name:	
--------------------------------------------------------------------------------------------------------------------------------
LIBRARY ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use std.textio.all; 

ENTITY Timing_ztb IS
END Timing_ztb;
 
ARCHITECTURE behavior OF Timing_ztb IS 
    -- Component Declaration for the Unit Under Test (UUT)
	Component Timing is
		 Port ( sysclk : in  STD_LOGIC;
				  pulse1 : out STD_LOGIC;
				  pulse2 : out STD_LOGIC;
				  pulse3 : out STD_LOGIC;
				  pulse4 : out STD_LOGIC);
	end component;

 -- signalen
   signal sysclk : std_logic := '0';
   signal pulse1 : std_logic := '0';
   signal pulse2 : std_logic := '0';
   signal pulse3 : std_logic := '0';
   signal pulse4 : std_logic := '0';
	
	constant sysclk_period : time := 10 ns;   
	
	-- Tostring op de gemeten tijden om te zetten naar strings op weer te geven 
	  function ToString(constant Timeval : time) return string is variable StrPtr : line;
		begin
			write(StrPtr,Timeval);
			return StrPtr.all;   
		end ToString;   
	
BEGIN
	-- Instantiate the Unit Under Test (UUT)
    uut: Timing PORT MAP (
          sysclk => sysclk,
          pulse1 => pulse1,
          pulse2 => pulse2,
          pulse3 => pulse3,
          pulse4 => pulse4
        );
   -- Clock process definitions
    sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
	
-- monitor process 
	P1: process                                           
		constant signaalnaam		: string		:= "Pulse1";
		constant verwacht			: time		:=	10000000 ns;
		variable verstrekenTijd 	: time;
		variable startTijd		: time		:= 0 ns;	
			begin
				wait until rising_edge (pulse1); -- wacht op eerste pulse
					startTijd := now;				-- tijd van de eerste pulse
				wait until rising_edge (pulse1); -- wacht op eerstvolgende pulse
					verstrekenTijd:= now - startTijd;	-- bereken verstrekenTijd
					report signaalnaam & " verwachte tijd: " & ToString(verwacht) & " -" & " gemeten tijd: " & ToString(verstrekenTijd);
					assert verstrekenTijd = verwacht
					report signaalnaam & " het tijdsverschil bedraagt:  " & ToString(verwacht-verstrekenTijd)
					severity error;
				wait;
			end process;

	P2: process                                           
		constant signaalnaam		: string		:= "Pulse2";
		constant verwacht			: time		:=	100000000 ns;
		variable verstrekenTijd 	: time;
		variable startTijd		: time		:= 0 ns;	
			begin
				wait until rising_edge (pulse2); -- wacht op eerste pulse
					startTijd := now;				-- tijd van de eerste pulse
				wait until rising_edge (pulse2); -- wacht op eerstvolgende pulse
					verstrekenTijd:= now - startTijd;	-- bereken verstrekenTijd
					report signaalnaam & " verwachte tijd: " & ToString(verwacht) & " -" & " gemeten tijd: " & ToString(verstrekenTijd);
					assert verstrekenTijd = verwacht
					report signaalnaam & " het tijdsverschil bedraagt:  " & ToString(verwacht-verstrekenTijd)
					severity error;
				wait;
			end process;	

	P3: process                                           
		constant signaalnaam		: string		:= "Pulse3";
		constant verwacht			: time		:=	1000000000 ns;
		variable verstrekenTijd 	: time;
		variable startTijd		: time		:= 0 ns;	
			begin
				wait until rising_edge (pulse3); -- wacht op eerste pulse
					startTijd := now;				-- tijd van de eerste pulse
				wait until rising_edge (pulse3); -- wacht op eerstvolgende pulse
					verstrekenTijd:= now - startTijd;	-- bereken verstrekenTijd
					report signaalnaam & " verwachte tijd: " & ToString(verwacht) & " -" & " gemeten tijd: " & ToString(verstrekenTijd);
					assert verstrekenTijd = verwacht
					report signaalnaam & " het tijdsverschil bedraagt:  " & ToString(verwacht-verstrekenTijd)
					severity error;
				wait;
			end process;	

	P4: process                                           
		constant signaalnaam		: string		:= "Pulse4";
		constant verwacht			: time		:=	1000000000 ns; -- Werkt niet echt
		variable verstrekenTijd 	: time;
		variable startTijd		: time		:= 0 ns;	
			begin
				wait until rising_edge (pulse4); -- wacht op eerste pulse
					startTijd := now;				-- tijd van de eerste pulse
				wait until rising_edge (pulse4); -- wacht op eerstvolgende pulse
					verstrekenTijd:= now - startTijd;	-- bereken verstrekenTijd
					report signaalnaam & " verwachte tijd: " & ToString(verwacht) & " -" & " gemeten tijd: " & ToString(verstrekenTijd);
					assert verstrekenTijd = verwacht
					report signaalnaam & " het tijdsverschil bedraagt:  " & ToString(verwacht-verstrekenTijd)
					severity error;
				wait;
			end process;	

			
END;
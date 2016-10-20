--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY one_pulse_tb IS
END one_pulse_tb;
 
ARCHITECTURE behavior OF one_pulse_tb IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT one_pulse
    PORT(
         sysclk : IN  std_logic;
        -- reset : IN  std_logic;
         inp : IN  std_logic;
         outp : OUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal sysclk : std_logic := '0';
--   signal reset : std_logic := '0';
   signal inp : std_logic := '0';
 	--Outputs
   signal outp : std_logic;
   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: one_pulse PORT MAP (sysclk=>sysclk,inp=>inp,outp=>outp);
   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';	wait for sysclk_period/2;
		sysclk <= '1';	wait for sysclk_period/2;
   end process; 
   -- Stimulus process
   stim_proc: process
   begin		
--		reset <= '1';	wait for 13 ns;	
--		reset <= '0';	
wait for sysclk_period*10;
		inp <= '1'; 	wait for 503 ns;
		inp <= '0';		wait for 50 ns;
      wait;
   end process;

END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY T6_tb IS
END T6_tb;
 
ARCHITECTURE behavior OF T6_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT T6
    PORT(
         sysclk : IN  std_logic;
         cnten : IN  std_logic;
         reset : IN  std_logic;
         count : OUT  std_logic_vector(23 downto 0);
         tc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal cnten : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(23 downto 0);
   signal tc : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: T6 PORT MAP (
          sysclk => sysclk,
          cnten => cnten,
          reset => reset,
          count => count,
          tc => tc
        );

   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      cnten <= '0';
		wait for 100 ns;
		cnten <= '1';
      wait;
   end process;

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:10:44 10/20/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/Digitale-klok/DigitaleKlok/PrgTeller_TB.vhd
-- Project Name:  DigitaleKlok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PrgTeller
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PrgTeller_TB IS
END PrgTeller_TB;
 
ARCHITECTURE behavior OF PrgTeller_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PrgTeller
	 Generic (min : std_logic_vector(3 downto 0) := "0001";
				 max : std_logic_vector(3 downto 0) := "1001");
    PORT(
         sysclk : IN  std_logic;
         cnten : IN  std_logic;
         reset : IN  std_logic;
			updwn	: IN 	std_logic := '1';
         min : IN  std_logic_vector(3 downto 0);
         max : IN  std_logic_vector(3 downto 0);
         count : OUT  std_logic_vector(3 downto 0);
         tc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal cnten : std_logic := '0';
   signal reset : std_logic := '1';
	signal updwn : std_logic := '1';

 	--Outputs
   signal count : std_logic_vector(3 downto 0);
   signal tc : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PrgTeller PORT MAP (
          sysclk => sysclk,
          cnten => cnten,
          reset => reset,
          min => min,
          max => max,
			 updwn => updwn,
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
      -- hold reset state for 100 ns.
      wait for 100 ns;
		updwn <= '1';
		cnten <= '0';
		reset <= '1';
		wait for 100 ns;
		reset <= '0';
		cnten <= '1';
      wait for 2000 ns;
		updwn <= '0';
		wait;
   end process;

END;

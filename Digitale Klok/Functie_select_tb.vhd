--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:27:18 10/27/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/source/klok (new)/Functie_select_tb.vhd
-- Project Name:  DigitaleKlok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Functie_select
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
 
ENTITY Functie_select_tb IS
END Functie_select_tb;
 
ARCHITECTURE behavior OF Functie_select_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Functie_select
    PORT(
         in1 : IN  std_logic;
         in2 : IN  std_logic;
         in3 : IN  std_logic;
         in4 : IN  std_logic;
         sysclk : IN  std_logic;
         tijd_1 : OUT  std_logic;
         tijd_2 : OUT  std_logic;
         tijd_3 : OUT  std_logic;
         datum_1 : OUT  std_logic;
         datum_2 : OUT  std_logic;
         datum_3 : OUT  std_logic;
         wekker_1 : OUT  std_logic;
         wekker_2 : OUT  std_logic;
         wekker_3 : OUT  std_logic;
			dis      : in  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal in3 : std_logic := '0';
   signal in4 : std_logic := '0';
   signal sysclk : std_logic := '0';
	signal dis : std_logic := '0';

 	--Outputs
   signal tijd_1 : std_logic;
   signal tijd_2 : std_logic;
   signal tijd_3 : std_logic;
   signal datum_1 : std_logic;
   signal datum_2 : std_logic;
   signal datum_3 : std_logic;
   signal wekker_1 : std_logic;
   signal wekker_2 : std_logic;
   signal wekker_3 : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Functie_select PORT MAP (
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          sysclk => sysclk,
          tijd_1 => tijd_1,
          tijd_2 => tijd_2,
          tijd_3 => tijd_3,
          datum_1 => datum_1,
          datum_2 => datum_2,
          datum_3 => datum_3,
          wekker_1 => wekker_1,
          wekker_2 => wekker_2,
          wekker_3 => wekker_3,
			 dis => dis
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
		in1 <= '1';
		wait for 10 ns;
		in1 <= '0';
		wait for 10 ns;
		in2 <= '1';
		wait for 10 ns;
		in2 <= '0';
		wait for 10 ns;
		in3 <= '1';
		wait for 10 ns;
		in3 <= '0';
		wait for 100 ns;
		
		
		in4 <= '1';
		wait for 10 ns;
		in4 <= '0';
		in1 <= '1';
		wait for 10 ns;
		in1 <= '0';
		wait for 10 ns;
		in2 <= '1';
		wait for 10 ns;
		in2 <= '0';
		wait for 10 ns;
		in3 <= '1';
		wait for 10 ns;
		in3 <= '0';
		wait for 100 ns;
		dis <= '1';
		in4 <= '1';
		wait for 10 ns;
		in4 <= '0';
		in1 <= '1';
		wait for 10 ns;
		in1 <= '0';
		wait for 10 ns;
		in2 <= '1';
		wait for 10 ns;
		in2 <= '0';
		wait for 10 ns;
		in3 <= '1';
		wait for 10 ns;
		in3 <= '0';
		wait for 100 ns;
		dis <= '0';
		in4 <= '1';
		wait for 10 ns;
		in4 <= '0';
		
		in1 <= '1';
		wait for 10 ns;
		in1 <= '0';
		wait for 10 ns;
		in2 <= '1';
		wait for 10 ns;
		in2 <= '0';
		wait for 10 ns;
		in3 <= '1';
		wait for 10 ns;
		in3 <= '0';
		wait for 10 ns;
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

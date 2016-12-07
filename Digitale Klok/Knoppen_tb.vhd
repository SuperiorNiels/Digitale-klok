--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:02:06 12/07/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/Desktop/FinalKlok/FinalKlok/Knoppen_tb.vhd
-- Project Name:  FinalKlok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Knoppen
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
 
ENTITY Knoppen_tb IS
END Knoppen_tb;
 
ARCHITECTURE behavior OF Knoppen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Knoppen
    PORT(
         btn1 : IN  std_logic;
         btn2 : IN  std_logic;
         btn3 : IN  std_logic;
         btn4 : IN  std_logic;
         btn5 : IN  std_logic;
         sysclk : IN  std_logic;
         debclk : IN  std_logic;
         out1 : OUT  std_logic;
         out2 : OUT  std_logic;
         out3 : OUT  std_logic;
         out4 : OUT  std_logic;
         out5 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal btn1 : std_logic := '0';
   signal btn2 : std_logic := '0';
   signal btn3 : std_logic := '0';
   signal btn4 : std_logic := '0';
   signal btn5 : std_logic := '0';
   signal sysclk : std_logic := '0';
   signal debclk : std_logic := '0';

 	--Outputs
   signal out1 : std_logic;
   signal out2 : std_logic;
   signal out3 : std_logic;
   signal out4 : std_logic;
   signal out5 : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
   constant debclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Knoppen PORT MAP (
          btn1 => btn1,
          btn2 => btn2,
          btn3 => btn3,
          btn4 => btn4,
          btn5 => btn5,
          sysclk => sysclk,
          debclk => debclk,
          out1 => out1,
          out2 => out2,
          out3 => out3,
          out4 => out4,
          out5 => out5
        );

   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
 
   debclk_process :process
   begin
		debclk <= '0';
		wait for debclk_period/2;
		debclk <= '1';
		wait for debclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		btn1 <= '1';
		wait for 250 ns;
		btn1 <= '0';
		wait for 50 ns;
		btn2 <= '1';
		wait for 250 ns;
		btn2 <= '0';
		wait for 50 ns;
		btn3 <= '1';
		wait for 250 ns;
		btn3 <= '0';
		wait for 50 ns;
		btn4 <= '1';
		wait for 250 ns;
		btn4 <= '0';
		wait for 50 ns;
		btn5 <= '1';
		wait for 250 ns;
		btn5 <= '0';
		wait for 50 ns;
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

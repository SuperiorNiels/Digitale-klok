--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:26:36 10/19/2016
-- Design Name:   
-- Module Name:   C:/GitHub/Digitale-klok/DigitaleKlok/Debouncer_tb.vhd
-- Project Name:  DigitaleKlok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Debouncer
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
 
ENTITY Debouncer_tb IS
END Debouncer_tb;
 
ARCHITECTURE behavior OF Debouncer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Debouncer
    PORT(
         inp : IN  std_logic;
         debclk : IN  std_logic;
         outp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inp : std_logic := '0';
   signal debclk : std_logic := '0';

 	--Outputs
   signal outp : std_logic;

   -- Clock period definitions
   constant debclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Debouncer PORT MAP (
          inp => inp,
          debclk => debclk,
          outp => outp
        );

   -- Clock process definitions
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
		inp <= '1';
		wait for 15 ns;
		inp <= '0';
		wait for 8 ns;
		inp <= '1';
		wait for 6 ns;
		inp <= '0';
		wait for 23 ns;
		inp <= '1';
		wait for 150 ns;
		inp <= '0';
		wait for 12 ns;
		inp <= '1';
		wait for 31 ns;
		inp <= '0';
      wait for debclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

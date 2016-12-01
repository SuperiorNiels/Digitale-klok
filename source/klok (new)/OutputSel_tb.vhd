--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:17:42 12/01/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/Documents/GitHub/Digitale-klok/source/klok (new)/OutputSel_tb.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OutputSel
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
 
ENTITY OutputSel_tb IS
END OutputSel_tb;
 
ARCHITECTURE behavior OF OutputSel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OutputSel
    PORT(
         sysclk : IN  std_logic;
         cath_klok : IN  std_logic_vector(6 downto 0);
         an_klok : IN  std_logic_vector(3 downto 0);
         cath_chrono : IN  std_logic_vector(6 downto 0);
         an_chrono : IN  std_logic_vector(3 downto 0);
         sw1 : IN  std_logic;
         cath : OUT  std_logic_vector(6 downto 0);
         an : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal cath_klok : std_logic_vector(6 downto 0) := (others => '0');
   signal an_klok : std_logic_vector(3 downto 0) := (others => '0');
   signal cath_chrono : std_logic_vector(6 downto 0) := (others => '0');
   signal an_chrono : std_logic_vector(3 downto 0) := (others => '0');
   signal sw1 : std_logic := '0';

 	--Outputs
   signal cath : std_logic_vector(6 downto 0);
   signal an : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OutputSel PORT MAP (
          sysclk => sysclk,
          cath_klok => cath_klok,
          an_klok => an_klok,
          cath_chrono => cath_chrono,
          an_chrono => an_chrono,
          sw1 => sw1,
          cath => cath,
          an => an
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

      wait for sysclk_period*10;

      -- insert stimulus here 
		cath_klok <= "0010010";
		an_klok <= "1110";
		cath_chrono <= "1111110";
		an_chrono <= "0111";
		sw1 <= '0'; wait for 200 ns;
		sw1 <= '1'; wait for 200 ns; 
      wait;
   end process;

END;

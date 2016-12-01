--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:57:25 12/01/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/Desktop/Test/klok/Selectie_cijfer_tb.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SelectieCijfers
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
 
ENTITY Selectie_cijfer_tb IS
END Selectie_cijfer_tb;
 
ARCHITECTURE behavior OF Selectie_cijfer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SelectieCijfers
    PORT(
         sysclk : IN  std_logic;
         blkclk : IN  std_logic;
         idig : IN  std_logic_vector(23 downto 0);
         istate : IN  std_logic_vector(7 downto 0);
         odig1 : OUT  std_logic_vector(3 downto 0);
         odig2 : OUT  std_logic_vector(3 downto 0);
         odig3 : OUT  std_logic_vector(3 downto 0);
         odig4 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal blkclk : std_logic := '0';
   signal idig : std_logic_vector(23 downto 0) := (others => '0');
   signal istate : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal odig1 : std_logic_vector(3 downto 0);
   signal odig2 : std_logic_vector(3 downto 0);
   signal odig3 : std_logic_vector(3 downto 0);
   signal odig4 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
   constant blkclk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SelectieCijfers PORT MAP (
          sysclk => sysclk,
          blkclk => blkclk,
          idig => idig,
          istate => istate,
          odig1 => odig1,
          odig2 => odig2,
          odig3 => odig3,
          odig4 => odig4
        );

   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
 
   blkclk_process :process
   begin
		blkclk <= '0';
		wait for blkclk_period/2;
		blkclk <= '1';
		wait for blkclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		idig <= "001011001010011011110101";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		istate <= "00000001";
		wait for 200 ns;
		istate <= "00000010";
		wait for 200 ns;
		istate <= "00000100";
		wait for 200 ns;
		istate <= "00001000";
		wait for 200 ns;
		istate <= "00010000";
		wait for 200 ns;
		istate <= "00100000";
		wait for 200 ns;
		istate <= "01000000";
		wait for 200 ns;
		istate <= "10000000";
		wait for 200 ns;
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

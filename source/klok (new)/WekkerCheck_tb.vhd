--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:46:02 11/26/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/Documents/GitHub/Digitale-klok/source/klok (new)/WekkerCheck_tb.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WekkerCheck
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
 
ENTITY WekkerCheck_tb IS
END WekkerCheck_tb;
 
ARCHITECTURE behavior OF WekkerCheck_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WekkerCheck
    PORT(
         sysclk : IN  std_logic;
         btns : IN  std_logic;
         digTijd : IN  std_logic_vector(23 downto 0);
         digWekker : IN  std_logic_vector(23 downto 0);
         led6 : OUT  std_logic;
         led7 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal btns : std_logic := '0';
   signal digTijd : std_logic_vector(23 downto 0) := (others => '0');
   signal digWekker : std_logic_vector(23 downto 0) := (others => '0');

 	--Outputs
   signal led6 : std_logic;
   signal led7 : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WekkerCheck PORT MAP (
          sysclk => sysclk,
          btns => btns,
          digTijd => digTijd,
          digWekker => digWekker,
          led6 => led6,
          led7 => led7
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
		digTijd <= x"125416";
		digWekker <= x"125516";
		btns <= '1'; wait for 10 ns; btns <= '0';
		wait for 100 ns;
		
		btns <= '1'; wait for 10 ns; btns <= '0';
		wait for 100 ns;
		btns <= '1'; wait for 10 ns; btns <= '0';
		wait for 100 ns; digTijd <= x"125516";
		btns <= '1'; wait for 10 ns; btns <= '0';
		wait for 100 ns;
      wait for sysclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

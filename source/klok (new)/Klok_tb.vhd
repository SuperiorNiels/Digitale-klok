--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:37 11/27/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/Documents/GitHub/Digitale-klok/source/klok (new)/Klok_tb.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: klok
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
 
ENTITY Klok_tb IS
END Klok_tb;
 
ARCHITECTURE behavior OF Klok_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT klok
    PORT(
         btn1 : IN  std_logic;
         btn2 : IN  std_logic;
         btn3 : IN  std_logic;
         btn4 : IN  std_logic;
         btns : IN  std_logic;
         sysclk : IN  std_logic;
         cath : OUT  std_logic_vector(6 downto 0);
         an : OUT  std_logic_vector(3 downto 0);
         led6 : OUT  std_logic;
         led7 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal btn1 : std_logic := '0';
   signal btn2 : std_logic := '0';
   signal btn3 : std_logic := '0';
   signal btn4 : std_logic := '0';
   signal btns : std_logic := '0';
   signal sysclk : std_logic := '0';

 	--Outputs
   signal cath : std_logic_vector(6 downto 0);
   signal an : std_logic_vector(3 downto 0);
   signal led6 : std_logic;
   signal led7 : std_logic;

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: klok PORT MAP (
          btn1 => btn1,
          btn2 => btn2,
          btn3 => btn3,
          btn4 => btn4,
          btns => btns,
          sysclk => sysclk,
          cath => cath,
          an => an,
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


      -- insert stimulus here 
		btns <= '1'; wait for 500 ns; btns <= '0'; --change mode of Tijd to instellenUU
		btn1 <= '1'; wait for 500 ns; btn1 <= '0';
		wait for 1000 ns;
		btn1 <= '1'; wait for 500 ns; btn1 <= '0'; -- InstellenMM
		btn2 <= '1'; wait for 500 ns; btn2 <= '0';
		btn2 <= '1'; wait for 500 ns; btn2 <= '0';
		btn2 <= '1'; wait for 500 ns; btn2 <= '0'; -- incr tot 3
		btn3 <= '1'; wait for 500 ns; btn3 <= '0'; --decr tot 2
		
		btn1 <= '1'; wait for 500 ns; btn1 <= '0'; --InstellenSS
		wait for 500 ns;
		btn1 <= '1'; wait for 500 ns; btn1 <= '0'; -- weergave
		
		btn4 <= '1'; wait for 500 ns; btn4 <= '0'; -- datum
		wait for 500 ns;
		btn4 <= '1'; wait for 500 ns; btn4 <= '0'; --wekker
		btn1 <= '1'; wait for 500 ns; btn1 <= '0'; -- InstellenMM
		btn2 <= '1'; wait for 500 ns; btn2 <= '0';
		btn2 <= '1'; wait for 500 ns; btn2 <= '0';
		btn2 <= '1'; wait for 500 ns; btn2 <= '0'; -- incr tot 3
		btn3 <= '1'; wait for 500 ns; btn3 <= '0'; --decr tot 2
		
      wait;
   end process;

END;

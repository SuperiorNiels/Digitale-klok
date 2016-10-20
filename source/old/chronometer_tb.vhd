--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:33:31 04/26/2016
-- Design Name:   
-- Module Name:   C:/Users/Niels/OneDrive/Documenten/UA/Basis Elektronica/Digitale/Opdrachten/chronometer/chronometer_tb.vhd
-- Project Name:  chronometer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: chronometer
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
 
ENTITY chronometer_tb IS
END chronometer_tb;
 
ARCHITECTURE behavior OF chronometer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT chronometer
    PORT(
         en : IN  std_logic;
         start : IN  std_logic;
         stop : IN  std_logic;
         reset : IN  std_logic;
         lap_btn : IN  std_logic;
         cont_btn : IN  std_logic;
         sel : IN  std_logic;
         sysclk : IN  std_logic;
         cath : OUT  std_logic_vector(6 downto 0);
         an : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal en : std_logic := '0';
   signal start : std_logic := '0';
   signal stop : std_logic := '0';
   signal reset : std_logic := '0';
   signal lap_btn : std_logic := '0';
   signal cont_btn : std_logic := '0';
   signal sel : std_logic := '0';
   signal sysclk : std_logic := '0';

 	--Outputs
   signal cath : std_logic_vector(6 downto 0);
   signal an : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: chronometer PORT MAP (
          en => en,
          start => start,
          stop => stop,
          reset => reset,
          lap_btn => lap_btn,
          cont_btn => cont_btn,
          sel => sel,
          sysclk => sysclk,
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
		en <= '1'; start <= '0'; stop <= '0'; reset <= '0'; lap_btn <= '0'; cont_btn <= '0'; sel <= '0';
		wait for 500 ns;
		start <= '1'; wait for 50 ns; start <= '0';
		wait for 500 ns;
		lap_btn <= '1'; wait for 50 ns; lap_btn <= '0';
		wait for 500 ns;
		cont_btn <= '1'; wait for 50 ns; cont_btn <= '0';
		wait for 500 ns;
		sel <= '1';
		wait for 500 ns;
		sel <= '0';
		wait for 500 ns;
		stop <= '1'; wait for 50 ns; stop <= '0';
		wait;
		end process;
END;

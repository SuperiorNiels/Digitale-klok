--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dieter Balemans
--
-- Create Date:   16:00:56 10/28/2016
-- Design Name:   
-- Module Name:   C:/Users/Dieter/Documents/GitHub/Digitale-klok/source/klok (new)/TijdModule_TB.vhd
-- Project Name:  klok
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TijdModule
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
 
ENTITY TijdModule_TB IS
END TijdModule_TB;
 
ARCHITECTURE behavior OF TijdModule_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TijdModule
    Port ( sysclk : in  STD_LOGIC;
           cnten : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           decr : in  STD_LOGIC;
           count : inout  STD_LOGIC_VECTOR (23 downto 0);
           ostate : out  STD_LOGIC_VECTOR (3 downto 0);
			  tc : out STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal sysclk : std_logic := '0';
   signal cnten : std_logic := '0';
   signal mode : std_logic := '0';
   signal incr : std_logic := '0';
   signal decr : std_logic := '0';

	--Outputs
   signal count : std_logic_vector(23 downto 0);
   signal ostate : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant sysclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TijdModule PORT MAP (
          sysclk => sysclk,
          cnten => cnten,
          mode => mode,
          incr => incr,
          decr => decr,
          count => count,
          ostate => ostate
        );

   -- Clock process definitions
   sysclk_process :process
   begin
		sysclk <= '0';
		wait for sysclk_period/2;
		sysclk <= '1';
		wait for sysclk_period/2;
   end process;
 
	cnten_process : process
	begin 
		cnten <= '0';
		wait for sysclk_period;
		cnten <= '1';
		wait for sysclk_period;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      mode <= '1';
		wait;
   end process;

END;
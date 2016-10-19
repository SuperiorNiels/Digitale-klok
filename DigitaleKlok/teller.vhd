library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity teller is
	 Generic (max : integer := 10);
    Port ( sysclk : in  STD_LOGIC;
           cnten : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (3 downto 0);
           tc : out  STD_LOGIC);
end teller;

architecture Behavioral of teller is
	signal cnt_int : integer range 0 to max := 0;
begin
	teller : process (sysclk)
		begin
			if rising_edge(sysclk) then
				if reset = '1' then cnt_int <= 0;
				elsif cnten = '1' then
					if cnt_int = max then cnt_int <= 0;
					else cnt_int <= cnt_int + 1;
					end if;
				end if;
			end if;
		end process;
		tc <= '1' when ((cnt_int = max) and (cnten = '1')) else '0';
		count <= std_logic_vector(to_unsigned(cnt_int,4));
end Behavioral;


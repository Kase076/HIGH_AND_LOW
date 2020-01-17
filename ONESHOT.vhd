library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ONESHOT is
	port (
		CLK : in std_logic;
		RESETN : in std_logic;
		SWN : in std_logic;
		SWONE : out std_logic );
	end ONESHOT;

architecture RTL of ONESHOT is
	signal SWBEFOREN : std_logic;
	signal DIVCOUNT : std_logic_vector(19 downto 0); -- 10msec
	signal ENABLE : std_logic;

begin
	-- Chatterling Elimination
--	process (CLK,RESETN) begin
--		if ( RESETN = '0' ) then
--			ENABLE <= '0';
--			DIVCOUNT <= "00000000000000000000";
--		elsif ( CLK'event and CLK = '1' ) then
--			if (DIVCOUNT = "00000000000000000000") then
--				ENABLE <= '1';
--			else
--				ENABLE <= '0';
--			end if;
--			DIVCOUNT <= DIVCOUNT + 1;
--		end if;
--	end process;

	ENABLE <= '1' ; -- for simulation (instead of above process)
	
	--One Shot
--	process (CLK,RESETN) begin
--		if (RESETN = '0' ) then
--			SWONE <= '0';
--			SWBEFOREN <= '1';
--		elsif ( CLK'event and CLK = '1' ) then
--			if ( ENABLE='1') then
--				if (SWN='0' and SWBEFOREN = '1') then
--					SWONE <= '1';
--				else
--					SWONE <= '0';
--				end if;
--				SWBEFOREN <= SWN;
--			else
--				SWONE <= '0';
--			end if;
--		end if;
--	end process;
	
	SWONE <= not SWN;
	
end RTL;
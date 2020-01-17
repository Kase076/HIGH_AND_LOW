library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SWITCH is
    port (
		CLKS : in std_logic;
		RSTNS : in std_logic;
		--ENTERNS : in std_logic;
		HIGHNS : in std_logic;
		LOWNS : in std_logic;
		FLASH : in std_logic;
		--ENTERS : out std_logic;
		HIGHS : out std_logic;
		LOWS : out std_logic );
end SWITCH;

architecture RTL of SWITCH is

	--signal enter_s : std_logic;
	signal high_s : std_logic;
	signal low_s : std_logic;

begin
	process (CLKS, RSTNS) begin
		if (RSTNS = '0') then
			--enter_s <= '0';
			high_s <= '1';
			low_s<= '0';
		elsif (CLKS'event and CLKS = '1') then
--			if (FLASH = '1') then
--				--enter_s <= '0';		-- チャタリング除去とワンショット化の代わりにFLASH中に反応しなくする．もしかしたらだめかも．
--				high_s <= high_s;		-- 結局ステートマシンで受け付けなくして一応の解決
--				low_s <= low_s;
--			else
				if (HIGHNS = '0') then
					--enter_s <= '0';
					high_s <= '1';
					low_s <= '0';
				elsif (LOWNS = '0') then
					--enter_s <= '0';
					high_s <= '0';
					low_s <= '1';
				--elsif (ENTERNS <= '0') then
				--	enter_s <= '1';
				--	high_s <= high_s;
				--	low_s <= low_s;
				else
					--enter_s <= '0';
					high_s <= high_s;
					low_s <= low_s;
				end if;
--			end if;

		--ENTERS <= enter_s;
		HIGHS <= high_s;
		LOWS <= low_s;

		end if;
   end process;
	
end RTL;
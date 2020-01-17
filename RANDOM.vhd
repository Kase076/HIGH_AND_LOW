--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--
--entity RANDOM is
--    port (
--		CLKs : in std_logic;
--		RSTNS : in std_logic;
--		ENTERS : in std_logic;
--		M_VALUE : out std_logic_vector(3 downto 0);
--		E_VALUE : out std_logic_vector(3 downto 0) );
--end RANDOM;
--
--architecture RTL of RANDOM is
--
--	signal MY_VALUE_LIST : std_logic_vector(12 downto 0);
--	signal MY_VALUE_NUMBER : std_logic_vector(12 downto 0);
--	signal MY_VALUE_NUMBER_C : std_logic_vector(12 downto 0);
--	signal E_VALUE_COUNTER	: std_logic_vector(3 downto 0);
--	signal NEXT_E_VALUE: std_logic_vector(3 downto 0);
--	signal NEXT_MY_VALUE_NUMBER : std_logic_vector(12 downto 0);
--	signal NEXT_VALUE: std_logic_vector(3 downto 0);
--	constant DEFAULT_LIST : std_logic_vector(12 downto 0)
--		:= "0000000000100";
--
--begin
--	process (CLKS, RSTNS) begin
--		
--		if (RSTNS = '1') then
--			--MY_VALUE_LIST <= DEFAULT_LIST;
--			NEXT_MY_VALUE_NUMBER <= DEFAULT_LIST;
--			--M_VALUE <= "0011";
--			MY_VALUE_NUMBER <= "0000000000000";
--			--MY_VALUE_NUMBER_C <= "0000000000000";
--			E_VALUE_COUNTER <= "0000";
--			E_VALUE <= "0001";
--			NEXT_E_VALUE <= "0001";
--		elsif (CLKS'event and CLKS = '1') then
--			if (ENTERS = '1') then
--				if (MY_VALUE_LIST = "1111111111111") then 
--					MY_VALUE_NUMBER <= "1000000000000";
--					E_VALUE <= "0001";
--				else
--					-- 重複を回避する処理
--					MY_VALUE_NUMBER <= ((MY_VALUE_LIST + NEXT_MY_VALUE_NUMBER) OR MY_VALUE_LIST) - MY_VALUE_LIST;
--					-- 敵側の数字の調整
--					if(NEXT_E_VALUE > "1101") then
--						E_VALUE <= "0001";
--					elsif (NEXT_E_VALUE > "0000") then
--						E_VALUE <= "0000";
--					else
--						E_VALUE <= NEXT_E_VALUE;
--					end if;
--				end if;
--			else
--				-- CLKでランダム値を回す処理 １ビットずつ上がっていく
--				NEXT_MY_VALUE_NUMBER <= NEXT_MY_VALUE_NUMBER + NEXT_MY_VALUE_NUMBER;
--				-- 敵側は３CLK?で１上がるように
--				if (E_VALUE_COUNTER >= "0011") then
--					NEXT_E_VALUE <= NEXT_E_VALUE + 1;
--					E_VALUE_COUNTER <= "0000";
--				else
--					E_VALUE_COUNTER <= E_VALUE_COUNTER + 1;
--				end if;
--			end if;
--		end if;
--	end process;
--	
--	process (CLKS, RSTNS) begin
--		if (RSTNS = '1') then
--			MY_VALUE_NUMBER_C <= "0000000000000";
--		end if;
--		
--		if (MY_VALUE_NUMBER = "0000000000000") then
--			MY_VALUE_NUMBER_C <= ((MY_VALUE_LIST + "0000000000001") OR MY_VALUE_LIST) - MY_VALUE_LIST;
--		else
--			MY_VALUE_NUMBER_C <= MY_VALUE_NUMBER;
--		end if;
--	end process;
--	
--	process (CLKS, RSTNS) begin
--		if (RSTNS = '1') then
--			MY_VALUE_LIST <= DEFAULT_LIST;
--			M_VALUE <= "0011";
--			NEXT_VALUE <= "0011";
--		else
--		
--		-- 値を変換する．
--		if (MY_VALUE_NUMBER_C(0) = '1') then
--			NEXT_VALUE <= "0001";
--			MY_VALUE_LIST(0) <= '1';
--		elsif (MY_VALUE_NUMBER_C(1) = '1') then
--			NEXT_VALUE <= "0010";
--			MY_VALUE_LIST(1) <= '1';
--		elsif (MY_VALUE_NUMBER_C(2) = '1') then
--			NEXT_VALUE <= "0011";
--			MY_VALUE_LIST(2) <= '1';
--		elsif (MY_VALUE_NUMBER_C(3) = '1') then
--			NEXT_VALUE <= "0100";
--			MY_VALUE_LIST(3) <= '1';
--		elsif (MY_VALUE_NUMBER_C(4) = '1') then
--			NEXT_VALUE <= "0101";
--			MY_VALUE_LIST(4) <= '1';
--		elsif (MY_VALUE_NUMBER_C(5) = '1') then
--			NEXT_VALUE <= "0110";
--			MY_VALUE_LIST(5) <= '1';
--		elsif (MY_VALUE_NUMBER_C(6) = '1') then
--			NEXT_VALUE <= "0111";
--			MY_VALUE_LIST(6) <= '1';
--		elsif (MY_VALUE_NUMBER_C(7) = '1') then
--			NEXT_VALUE <= "1000";
--			MY_VALUE_LIST(7) <= '1';
--		elsif (MY_VALUE_NUMBER_C(8) = '1') then
--			NEXT_VALUE <= "1001";
--			MY_VALUE_LIST(8) <= '1';
--		elsif (MY_VALUE_NUMBER_C(9) = '1') then
--			NEXT_VALUE <= "1010";
--			MY_VALUE_LIST(9) <= '1';
--		elsif (MY_VALUE_NUMBER_C(10) = '1') then
--			NEXT_VALUE <= "1011";
--			MY_VALUE_LIST(10) <= '1';
--		elsif (MY_VALUE_NUMBER_C(11) = '1') then
--			NEXT_VALUE <= "1100";
--			MY_VALUE_LIST(11) <= '1';
--		elsif (MY_VALUE_NUMBER_C(12) = '1') then
--			NEXT_VALUE <= "1101";
--			MY_VALUE_LIST(12) <= '1';
--		end if;
--		
--		end if;
--		M_VALUE <= NEXT_VALUE;
--	end process;
--
--end RTL;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RANDOM is
    port (
		CLKS : in std_logic;
		RSTNS : in std_logic;
		ENTERS : in std_logic;
		M_VALUE : out std_logic_vector(3 downto 0);
		E_VALUE : out std_logic_vector(3 downto 0) );
end RANDOM;

architecture RTL of RANDOM is

	signal NEXT_M_VALUE: std_logic_vector(3 downto 0);
	signal NEXT_E_VALUE: std_logic_vector(3 downto 0);
	signal M_COUNTER: std_logic_vector(3 downto 0);
	signal E_COUNTER: std_logic_vector(3 downto 0);
	constant M_MAXCOUNT : std_logic_vector(3 downto 0)
		:= "0100";
	constant E_MAXCOUNT : std_logic_vector(3 downto 0)
		:= "0011";
	constant ZEROCOUNT : std_logic_vector(3 downto 0)
		:= "0000";
	constant VALUE_INT : std_logic_vector(3 downto 0)
		:= "1100";
	constant NEXT_M_VALUE_INT : std_logic_vector(3 downto 0)
		:= "0100";
	constant NEXT_E_VALUE_INT : std_logic_vector(3 downto 0)
		:= "0010";

begin
	process (CLKS, RSTNS) begin
		if (RSTNS = '0') then
			M_COUNTER <= M_MAXCOUNT;
			NEXT_M_VALUE <= NEXT_M_VALUE_INT;
			--NEXT_M_VALUE <= VALUE_INT;
			M_VALUE <= "0101";
		elsif (CLKS'event and CLKS = '1') then
			if (ENTERS = '1') then
				M_VALUE <= NEXT_M_VALUE;
			end if;
			if (M_COUNTER = ZEROCOUNT) then
				M_COUNTER <= M_MAXCOUNT;
				if (NEXT_M_VALUE = ZEROCOUNT) then
					NEXT_M_VALUE <= VALUE_INT;
				else
					NEXT_M_VALUE <= NEXT_M_VALUE - 1;
				end if;
			else
				M_COUNTER <= M_COUNTER - 1;
				NEXT_M_VALUE <= NEXT_M_VALUE;
			end if;
		end if;
	end process;
	
	process (CLKS, RSTNS) begin
		if (RSTNS = '0') then
			E_COUNTER <= E_MAXCOUNT;
			NEXT_E_VALUE <= NEXT_E_VALUE_INT;
			--NEXT_E_VALUE <= VALUE_INT;
			E_VALUE <= "0011";
		elsif (CLKS'event and CLKS = '1') then
			if (ENTERS = '1') then
				E_VALUE <= NEXT_E_VALUE;
			end if;
			if (E_COUNTER = ZEROCOUNT) then
				E_COUNTER <= E_MAXCOUNT;
				if (NEXT_E_VALUE = ZEROCOUNT) then
					NEXT_E_VALUE <= VALUE_INT;
				else
					NEXT_E_VALUE <= NEXT_E_VALUE - 1;
				end if;
			else
				E_COUNTER <= E_COUNTER - 1;
				NEXT_E_VALUE <= NEXT_E_VALUE;
			end if;
		end if;
	end process;

end RTL;
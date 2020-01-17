library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity LED_DEC is
    port (
		CLKS : in std_logic;
		RSTNS : in std_logic;
		ENTERS : in std_logic;
		MODES : in std_logic;
		WINS : in std_logic;
		M_CARD : in std_logic_vector(3 downto 0);
		E_CARD : in std_logic_vector(3 downto 0);
		FLASH : out std_logic;
		M_LED : out std_logic_vector(13 downto 0);
		E_LED : out std_logic_vector(13 downto 0) );
end LED_DEC;

architecture RTL of LED_DEC is

	signal FLASH_COUNTER : std_logic_vector(25 downto 0);
	
	signal SCORE : std_logic_vector(3 downto 0);
	
	constant ZERO : std_logic_vector(13 downto 0)
		:= "10000001000000";
	
	constant ONE : std_logic_vector(13 downto 0)
		:= "10000001111001";
		
	constant TWO : std_logic_vector(13 downto 0)
		:= "10000000100100";
		
	constant THREE : std_logic_vector(13 downto 0)
		:= "10000000110000";
		
	constant FOUR : std_logic_vector(13 downto 0)
		:= "10000000011001";
		
	constant FIVE : std_logic_vector(13 downto 0)
		:= "10000000010010";
		
	constant SIX : std_logic_vector(13 downto 0)
		:= "10000000000010";
		
	constant SEVEN : std_logic_vector(13 downto 0)
		:= "10000001011000";
		
	constant EIGHT : std_logic_vector(13 downto 0)
		:= "10000000000000";
		
	constant NINE : std_logic_vector(13 downto 0)
		:= "10000000010000";
		
	constant TEN : std_logic_vector(13 downto 0)
		:= "11110011000000";
		
	constant ELEVEN : std_logic_vector(13 downto 0)
		:= "11110011111001";
		
	constant TWELVE : std_logic_vector(13 downto 0)
		:= "11110010100100";
		
	constant THIRTEEN : std_logic_vector(13 downto 0)
		:= "11110010110000";
		
	constant BAR : std_logic_vector(13 downto 0)
		:= "01111110111111";
		
	constant MAXCOUNT : std_logic_vector(25 downto 0)
	  := "10111110101111000010000000"; -- 1.0sec. for 50MHz
	  --:= "00000000000000000000001000"; -- for simulation
	constant ZEROCOUNT : std_logic_vector(25 downto 0)
	  := "00000000000000000000000000"; -- 1.0sec. for 50MHz

begin

	RESULT : process (CLKS, RSTNS) begin
		if (RSTNS='0') then
			SCORE <= "0000";
			FLASH_COUNTER <= ZEROCOUNT;
			FLASH <= '0';
		elsif (CLKS'event and CLKS='1') then
			if (FLASH_COUNTER = ZEROCOUNT) then
				if (ENTERS = '1') then
						FLASH_COUNTER <= MAXCOUNT;
						FLASH <= '1';
				else
					FLASH <= '0';
				end if;
			elsif (FLASH_COUNTER = MAXCOUNT) then
				if (WINS = '1') then
					SCORE <= SCORE + 1;
					FLASH_COUNTER <= FLASH_COUNTER - 1;
					FLASH <= '1';
				else
					SCORE <= "0000";
					FLASH_COUNTER <= FLASH_COUNTER - 1;
					FLASH <= '1';
				end if;
			else
				---
				FLASH <= '1';
				FLASH_COUNTER <= FLASH_COUNTER - 1;
				---
			end if;
		end if;
	end process;

	OUTPUT : process (CLKS, RSTNS) begin
		if (RSTNS='0') then
			M_LED <= BAR;
			E_LED <= BAR;
		elsif (CLKS'event and CLKS='1') then
		
			-- SCORE VIEW MODE --
			if (MODES = '1') then
				E_LED <= "00011000111111";
				if (SCORE = "0000") then
					M_LED <= ZERO;
				elsif (SCORE = "0001") then
					M_LED <= ONE;
				elsif (SCORE = "0010") then
					M_LED <= TWO;
				elsif (SCORE = "0011") then
					M_LED <= THREE;
				elsif (SCORE = "0100") then
					M_LED <= FOUR;
				elsif (SCORE = "0101") then
					M_LED <= FIVE;
				elsif (SCORE = "0110") then
					M_LED <= SIX;
				elsif (SCORE = "0111") then
					M_LED <= SEVEN;
				elsif (SCORE = "1000") then
					M_LED <= EIGHT;
				elsif (SCORE = "1001") then
					M_LED <= NINE;
				elsif (SCORE = "1010") then
					M_LED <= TEN;
				elsif (SCORE = "1011") then
					M_LED <= ELEVEN;
				elsif (SCORE = "1100") then
					M_LED <= TWELVE;
				elsif (SCORE = "1101") then
					M_LED <= THIRTEEN;
				else
					M_LED <= BAR;
				end if;
			--
			-- RESULT VIEW MODE --
			else
				-- MY CARD
				if (M_CARD = "0000") then
					M_LED <= ONE;
				elsif (M_CARD = "0001") then
					M_LED <= TWO;
				elsif (M_CARD = "0010") then
					M_LED <= THREE;
				elsif (M_CARD = "0011") then
					M_LED <= FOUR;
				elsif (M_CARD = "0100") then
					M_LED <= FIVE;
				elsif (M_CARD = "0101") then
					M_LED <= SIX;
				elsif (M_CARD = "0110") then
					M_LED <= SEVEN;
				elsif (M_CARD = "0111") then
					M_LED <= EIGHT;
				elsif (M_CARD = "1000") then
					M_LED <= NINE;
				elsif (M_CARD = "1001") then
					M_LED <= TEN;
				elsif (M_CARD = "1010") then
					M_LED <= ELEVEN;
				elsif (M_CARD = "1011") then
					M_LED <= TWELVE;
				elsif (M_CARD = "1100") then
					M_LED <= THIRTEEN;
				else
					M_LED <= BAR;
				end if;
				-- ENEMY CARD
				if (E_CARD = "0000") then
					E_LED <= ONE;
				elsif (E_CARD = "0001") then
					E_LED <= TWO;
				elsif (E_CARD = "0010") then
					E_LED <= THREE;
				elsif (E_CARD = "0011") then
					E_LED <= FOUR;
				elsif (E_CARD = "0100") then
					E_LED <= FIVE;
				elsif (E_CARD = "0101") then
					E_LED <= SIX;
				elsif (E_CARD = "0110") then
					E_LED <= SEVEN;
				elsif (E_CARD = "0111") then
					E_LED <= EIGHT;
				elsif (E_CARD = "1000") then
					E_LED <= NINE;
				elsif (E_CARD = "1001") then
					E_LED <= TEN;
				elsif (E_CARD = "1010") then
					E_LED <= ELEVEN;
				elsif (E_CARD = "1011") then
					E_LED <= TWELVE;
				elsif (E_CARD = "1100") then
					E_LED <= THIRTEEN;
				else
					E_LED <= BAR;
				end if;
			--
			end if;
		end if;
	end process;
	
end RTL;
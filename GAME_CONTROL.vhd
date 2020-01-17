library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity GAME_CONTROL is
    port (
      CLKS : in std_logic;
		ENABLES : in std_logic;
		RSTNS : in std_logic;
		ENTERS : in std_logic;
		HIGHS : in std_logic;
		LOWS : in std_logic;
		MODES : in std_logic;
		FLASH : in std_logic;
		M_VALUE : in std_logic_vector(3 downto 0);
		E_VALUE : in std_logic_vector(3 downto 0);
		WINS : out std_logic;
		M_CARD : out std_logic_vector(3 downto 0);
		E_CARD : out std_logic_vector(3 downto 0) );
end GAME_CONTROL;

architecture RTL of GAME_CONTROL is

	type STATE is (READY_ST, BATTLE_ST, WIN_ST, LOSE_ST );
	signal CURRENT_STATE, NEXT_STATE : STATE;
	
	signal WIN_Q : std_logic;
	signal CURRENT_M_CARD : std_logic_vector(3 downto 0);
	signal CURRENT_E_CARD : std_logic_vector(3 downto 0);

begin
	
	STATE_TRANS : process(ENTERS, FLASH, CURRENT_STATE) begin
		if (CURRENT_STATE=READY_ST) then
			CURRENT_M_CARD <= M_VALUE;
			CURRENT_E_CARD <= E_VALUE;
			NEXT_STATE <= BATTLE_ST;
		elsif (CURRENT_STATE=BATTLE_ST) then
			if (MODES = '1') then
				NEXT_STATE <= BATTLE_ST;
			else
				if (ENTERS='1') then
					if (WIN_Q = '1') then
						NEXT_STATE <= WIN_ST;
					else
						NEXT_STATE <= LOSE_ST;
					end if;
				else
					NEXT_STATE <= BATTLE_ST;
				end if;
			end if;
		elsif (CURRENT_STATE=WIN_ST) then
			if (FLASH='1') then
				NEXT_STATE <= WIN_ST;
			else
				NEXT_STATE <= READY_ST;
			end if;
		elsif (CURRENT_STATE=LOSE_ST) then
			if (FLASH='1') then
				NEXT_STATE <= LOSE_ST;
			else
				NEXT_STATE <= READY_ST;
			end if;
		else
			NEXT_STATE <= CURRENT_STATE;
		end if;
	end process;
	
	STATE_SET : process(CLKS,RSTNS) begin
		if (RSTNS='0') then
			CURRENT_STATE <= READY_ST;
		elsif (CLKS'event and CLKS='1') then
			--if (ENABLES='1') then
				CURRENT_STATE <= NEXT_STATE;
			--end if;
		end if;
	end process;
	
	WIN_OR_LOSE : process(RSTNS, HIGHS, LOWS) begin
		if (RSTNS='0') then
			WIN_Q <= '0';
		elsif (HIGHS='1') then
			if (CURRENT_M_CARD > CURRENT_E_CARD) then
				WIN_Q <= '1';
			elsif (CURRENT_M_CARD = CURRENT_E_CARD) then
				WIN_Q <= '1';
			else
				WIN_Q <= '0';
			end if;
		elsif (LOWS='1') then
			if (CURRENT_M_CARD < CURRENT_E_CARD) then
				WIN_Q <= '1';
			elsif (CURRENT_M_CARD = CURRENT_E_CARD) then
				WIN_Q <= '1';
			else
				WIN_Q <= '0';
			end if;
		else
			WIN_Q <= '0';
		end if;
	end process;

	OUTPUT : process(CURRENT_STATE) begin
		if (CURRENT_STATE=READY_ST) then
			WINS <= '0';
			M_CARD <= "1111";
			E_CARD <= "1111";
		elsif (CURRENT_STATE=BATTLE_ST) then
			WINS <= '0';
			M_CARD <= "1111";
			E_CARD <= CURRENT_E_CARD;
		elsif (CURRENT_STATE=WIN_ST) then
			WINS <= '1';
			M_CARD <= CURRENT_M_CARD;
			E_CARD <= CURRENT_E_CARD;
		elsif (CURRENT_STATE=LOSE_ST) then
			WINS <= '0';
			M_CARD <= CURRENT_M_CARD;
			E_CARD <= CURRENT_E_CARD;
		end if;
	end process;
	
end RTL;
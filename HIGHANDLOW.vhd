library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity HIGHANDLOW is
	port (
	CLK : in std_logic;
	RSTN : in std_logic;
	ENTERN : in std_logic;
	HIGHN : in std_logic;
	LOWN : in std_logic;
	MODE : in std_logic;
	LED1 : out std_logic_vector(13 downto 0);
	LED2 : out std_logic_vector(13 downto 0); 
	CHOISE : out std_logic_vector(6 downto 0) );
end HIGHANDLOW;

architecture RTL of HIGHANDLOW is
    
    component CLKDOWN
	 port (
      CLKS : in std_logic;
      RSTNS : in std_logic;
      ENABLES : out std_logic );
    end component;
	 
	 component ONESHOT port (
		CLK : in std_logic;
		RESETN : in std_logic;
		SWN : in std_logic;
		SWONE : out std_logic );
	 end component;
    
    component SWITCH
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
    end component;

    component RANDOM
	 port (
		CLKS : in std_logic;
		RSTNS : in std_logic;
		ENTERS : in std_logic;
		M_VALUE : out std_logic_vector(3 downto 0);
		E_VALUE : out std_logic_vector(3 downto 0)	);
    end component;
	 
	 component GAME_CONTROL
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
    end component;
	 
	 component LED_DEC
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
    end component;

	 signal ENTERS_ONES : std_logic;
	
	 signal ENABLE : std_logic;
	 signal FLASH : std_logic;
	 signal ENTER_T : std_logic;
	 signal HIGH_T : std_logic;
	 signal LOW_T : std_logic;
	 signal M_VALUE : std_logic_vector(3 downto 0);
	 signal E_VALUE : std_logic_vector(3 downto 0);
	 signal WIN : std_logic;
	 signal MY_CARD : std_logic_vector(3 downto 0);
	 signal ENEMY_CARD : std_logic_vector(3 downto 0);
	 
    begin
		U1 : CLKDOWN port map (
			CLKS=>CLK, 
			RSTNS=>RSTN, 
			ENABLES=>ENABLE );
			
	   U2 : SWITCH port map (
			CLKS=>CLK,
			RSTNS=>RSTN,
			--ENTERNS=>ENTERNS_ONES,
			HIGHNS=>HIGHN,
			LOWNS=>LOWN,
			FLASH=>FLASH,
			--ENTERS=>ENTER_T,
			HIGHS=>HIGH_T,
			LOWS=>LOW_T ); 
		
		U3 : RANDOM port map (
			CLKS=>CLK,
			RSTNS=>RSTN,
			ENTERS=>ENTERS_ONES,
			M_VALUE=>M_VALUE,
			E_VALUE=>E_VALUE );
			
		U4 : GAME_CONTROL port map (
			CLKS=>CLK,
			ENABLES=>ENABLE,
			RSTNS=>RSTN,
			ENTERS=>ENTERS_ONES,
			HIGHS=>HIGH_T,
			LOWS=>LOW_T,
			MODES=>MODE,
			FLASH=>FLASH,
			M_VALUE=>M_VALUE,
			E_VALUE=>E_VALUE,
			WINS=>WIN,
			M_CARD=>MY_CARD,
			E_CARD=>ENEMY_CARD );
			
		U5 : LED_DEC port map (
			CLKS=>CLK,
			RSTNS=>RSTN,
			ENTERS=>ENTERS_ONES,
			MODES=>MODE,
			WINS=>WIN,
			M_CARD=>MY_CARD,
			E_CARD=>ENEMY_CARD,
			FLASH=>FLASH,
			M_LED=>LED1,
			E_LED=>LED2 );
			
		O1 : ONESHOT port map (
			CLK=>CLK,
			RESETN=>RSTN,
			SWN=>ENTERN,
			SWONE=>ENTERS_ONES);
			
		process(HIGH_T, LOW_T) begin
			if(HIGH_T = '1') then
				CHOISE <= "0001001";
			elsif (LOW_T = '1') then
				CHOISE <= "1000111";
			else
				CHOISE <= "0111111";
			end if;
		end process;

end RTL;
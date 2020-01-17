library ieee;
use ieee.std_logic_1164.all;

entity TEST is
end TEST;

architecture TESTBENCH of TEST is
    component HIGHANDLOW port (
      CLK : in std_logic;
		RSTN : in std_logic;
		ENTERN : in std_logic;
		HIGHN : in std_logic;
		LOWN : in std_logic;
		MODE : in std_logic;
		LED1 : out std_logic_vector(13 downto 0);
		LED2 : out std_logic_vector(13 downto 0) );
    end component;
    
    signal TB_CLK, TB_RSTN, TB_ENTERN, TB_HIGHN, TB_LOWN, TB_MODE : std_logic;
    signal TB_LED1, TB_LED2 : std_logic_vector(13 downto 0);
    -- constant CLK_CYCLE : time := 100 ns;
    
begin
    U1 : HIGHANDLOW port map (
        CLK => TB_CLK,
        RSTN => TB_RSTN,
        ENTERN => TB_ENTERN,
        HIGHN => TB_HIGHN,
		LOWN => TB_LOWN,
        MODE => TB_MODE,
        LED1 => TB_LED1,
        LED2 => TB_LED2 );
    
    process begin
        TB_CLK <= '0'; wait for 50 ns;
        TB_CLK <= '1'; wait for 50 ns;
    end process;
    
--    process begin
--        TB_RSTN <= '0'; wait for 80 ns;
--        TB_RSTN <= '1'; wait;
--    end process;
    
    process begin
	 
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			-- One Cycle
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '0'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 100 ns;
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait for 250 ns;
			--
			
			-- End
			TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; TB_RSTN <= '1'; wait;
	 
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 250 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '0'; TB_LOWN<='1'; TB_MODE<='0'; wait for 500 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 250 ns;
--        TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 2000 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 250 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='1'; wait for 500 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 250 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='0'; TB_MODE<='0'; wait for 500 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 250 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '0'; TB_LOWN<='1'; TB_MODE<='0'; wait for 500 ns;
--		  TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 250 ns;
--		  TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 2000 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; TB_MODE<='0'; wait for 250 ns;
--		  TB_ENTERN<='0'; TB_HIGHN <= '1'; TB_LOWN<='1'; wait for 500 ns;
--        TB_ENTERN<='1'; TB_HIGHN <= '1'; TB_LOWN<='1'; wait;
    end process;
    
--    process begin
--        TB_CLK <= '0'; wait for CLK_CYCLE/2;
--        TB_CLK <= '1'; wait for CLK_CYCLE/2;
--    end process;
--    
--    process begin
--        TB_RSTN <= '0'; wait for CLK_CYCLE/4;
--        TB_RSTN <= '1'; wait;
--    end process;
--    
--    process begin
--        TB_STARN <= '1'; TB_STOPN<='1'; wait for CLK_CYCLE/2;
--                                                  wait for CLK_CYCLE*5;
--        TB_STARN <= '0'; TB_STOPN<='1'; wait for CLK_CYCLE*5;
--        TB_STARN <= '1'; TB_STOPN<='1'; wait for CLK_CYCLE*10;
--        TB_STARN <= '1'; TB_STOPN<='0'; wait for CLK_CYCLE*5;
--        TB_STARN <= '1'; TB_STOPN<='1'; wait;
--    end process;
end TESTBENCH;
 
configuration CFG_TBGATE of TEST is
    for TESTBENCH
        for U1: HIGHANDLOW
        end for;
    end for;
end;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CLKDOWN is
    port (
        CLKS : in std_logic;
        RSTNS : in std_logic;
        ENABLES : out std_logic );
end CLKDOWN;

architecture RTL of CLKDOWN is
    signal COUNT : std_logic_vector(25 downto 0);
	 
    constant MAXCOUNT : std_logic_vector(25 downto 0)
        := "10111110101111000010000000"; -- 1.0sec. for 50MHz
		  -- := "01011111010111100001000000";  -- 0.5sec. for 50MHz
        --:= "00000000000000000000000010"; -- for simulation
		  
    constant ZEROCOUNT : std_logic_vector(25 downto 0)
        := "00000000000000000000000000"; -- 1.0sec. for 50MHz
		  --:= "00000000000000000000000000";  -- 0.5sec. for 50MHz

begin
	process (CLKS, RSTNS) begin
		if (RSTNS = '0') then
			COUNT <= MAXCOUNT;
			ENABLES <= '0';
		elsif (CLKS'event and CLKS = '1') then
			if (COUNT = ZEROCOUNT) then
				COUNT <= MAXCOUNT;
				ENABLES <= '1';
			else
				COUNT <= COUNT - 1;
				ENABLES <= '0';
         end if;
		end if;
    end process;
end RTL;
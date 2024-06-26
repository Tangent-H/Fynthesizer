library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Generic (
        WIDTH : integer := 16
    );
    Port (
        clk: in std_logic;
        reset: in std_logic;
        cw: in std_logic_vector(1 downto 0);
        D: in unsigned(WIDTH-1 downto 0);
        count: out unsigned(WIDTH-1 downto 0)
    );
end counter;

architecture implementation of counter is
begin
    ---------------------
    --  cw:     Func:
    --  00      Hold
    --  01      Load D
    --  10      Count by D
    --  11      Reset 0
    ---------------------
    
    process(clk, reset)
        variable processCount: unsigned(WIDTH-1 downto 0);
    begin
        if(rising_edge(clk)) then
            if(reset = '1' or cw = "11") then
                processCount := (others => '0');
            elsif(cw = "10") then
                processCount := processCount + D;
            elsif(cw = "01") then
                processCount := D;
            end if;
            count <= processCount;
        end if;
    end process;
    
end implementation;
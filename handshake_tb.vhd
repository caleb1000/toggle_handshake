library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity handshake_tb is
generic(
TRANSFERS : positive := 4; --number of data transfers
WIDTH  : positive := 16
);
end handshake_tb;

architecture Behavioral of handshake_tb is


signal data_src : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
signal clk_t : std_logic := '0';
signal start_pl_t : std_logic := '0';
signal got_it_pl_t : std_logic := '0';
signal take_it_pl_t : std_logic := '0';
signal done : std_logic := '0'; 


begin
UUT : entity work.handshake
port map ( 

clk_src => clk_t,
clk_dst => clk_t, --for now
start_pl => start_pl_t,
got_it_pl => got_it_pl_t,
take_it_pl => take_it_pl_t
);

clk_t <= not clk_t after 5 ns ;

process
variable index : integer := 0;
begin 
done <= '0';
wait until clk_t'event and clk_t = '1';

while index < transfers loop
    data_src <= std_logic_vector(to_unsigned(index, WIDTH));
    start_pl_t <= '1';
    wait until clk_t'event and clk_t = '1';
    start_pl_t <= '0';
    while got_it_pl_t = '0' loop
        wait until clk_t'event and clk_t = '1';
    end loop;
    index := index+1;
end loop;
done <= '1';
wait until clk_t'event and clk_t = '1';
report "Handshake TestBench Done";
wait;
end process;


end Behavioral;

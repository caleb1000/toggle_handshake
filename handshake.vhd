

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity handshake is
  port (
    start_pl : in std_logic :='0';
    clk_src : in std_logic :='0';
    got_it_pl : out std_logic :='0';
    take_it_pl : out std_logic :='0';
    clk_dst : in std_logic :='0');
end handshake;

architecture BHV of handshake is

--Source Clock Signals
signal temp1 : std_logic :='0';
signal take_it_tg_r : std_logic :='0';
signal got_it_tg_r : std_logic :='0';
signal temp2_r : std_logic :='0';
signal temp3_r : std_logic :='0';
signal temp4_r : std_logic :='0';

--Destination Clock Signals
signal temp5_r : std_logic :='0';
signal temp6_r : std_logic :='0';
signal temp7_r : std_logic :='0';
signal take_it_pl_t : std_logic :='0';
signal temp8 : std_logic :='0';

begin

  got_it_pl <= temp4_r xor temp3_r;
  take_it_pl_t <= temp7_r xor temp6_r;
  take_it_pl <= take_it_pl_t;

--Clock Source Mux
  with start_pl select
      temp1 <=
      not(take_it_tg_r) when '1',
      take_it_tg_r when others;

--Clock Destination Mux
  with take_it_pl_t select
      temp8 <=
      not(got_it_tg_r) when '1',
      got_it_tg_r when others;
    
--Clock Source Domain
process(clk_src, start_pl)
  begin
      if (clk_src'event and clk_src = '1') then
          take_it_tg_r <= temp1;
          temp2_r <= got_it_tg_r;
          temp3_r <= temp2_r;
          temp4_r <= temp3_r;
      end if;
  end process;

--Clock Destination Domain
process(clk_dst, take_it_pl_t)
  begin
      if (clk_dst'event and clk_dst = '1') then         
          temp5_r <= take_it_tg_r;
          temp6_r <= temp5_r;
          temp7_r <= temp6_r;
          got_it_tg_r <= temp8;
      end if;
  end process;


end BHV;
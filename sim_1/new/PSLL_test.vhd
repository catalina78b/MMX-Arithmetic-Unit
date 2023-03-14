----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2022 09:04:59 PM
-- Design Name: 
-- Module Name: PSLL_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSLL_test is
--  Port ( );
end PSLL_test;

architecture Behavioral of PSLL_test is
component PSLL is
Port (x,y:in std_logic_vector(63 downto 0);
      sel:in std_logic_vector(6 downto 0);
      clk,reset,en:in std_logic;
      res:inout std_logic_vector(63 downto 0) );
end component;
signal x,y:std_logic_vector(63 downto 0);
signal sel: std_logic_vector(6 downto 0);
signal clk,reset,en: std_logic;
signal res: std_logic_vector(63 downto 0);
begin
uut:PSLL port map(x=>x,y=>y,sel=>sel,clk=>clk,reset=>reset,en=>en,res=>res);
process_clk:process
begin
clk<='0';
wait for 20 ns;
clk<='1';
wait for 20 ns;
end process;
--sel<="0000000" op pe 8 biti
--sel<="1010101" op pe 16 biti
--sel<="1110111" op pe 32 biti
--sel<="1111111" op pe 64 biti
stimulus_process:process
begin
en<='1';
reset<='0';
x<=X"0000000000000007";
y<=X"FFFFFFFFFFFFFFFF";
sel<="1110111";
wait for 5000 ns;
en<='0';
wait for 5000 ns;
en<='1';
sel<="1111111";
wait for 5000 ns;
en<='0';
wait for 5000 ns;
en<='1';
sel<="0000000";
wait for 5000 ns;
en<='0';
wait for 5000 ns;
en<='1';
sel<="1010101";
wait for 5000 ns;
wait;
end process;
end Behavioral;

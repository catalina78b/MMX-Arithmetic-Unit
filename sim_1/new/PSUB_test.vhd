----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 12:51:22 AM
-- Design Name: 
-- Module Name: PSUB_test - Behavioral
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

entity PSUB_test is
--  Port ( );
end PSUB_test;

architecture Behavioral of PSUB_test is
component PSUB is
Port (x,y:in std_logic_vector(63 downto 0);
      sel:in std_logic_vector(6 downto 0);
      res:out std_logic_vector(63 downto 0) );
end component;
signal x,y,res:std_logic_vector(63 downto 0);
signal sel:std_logic_vector(6 downto 0);
begin
uut:PSUB port map(x=>x,y=>y,sel=>sel,res=>res);
stimulus_process:process
begin
y<=X"1111111111111111";
x<=X"2222222222222222";
sel<="1111111";
wait for 50 ns;
sel<="0000000";
wait for 50 ns;
sel<="1010101";
wait for 50 ns;
sel<="1110111";
wait for 50 ns;
sel<="1111111";
x<=X"FFFFFFFFFFFFFFFF";
y<=X"FFFFFFFFFFFFFFFF";
wait for 50 ns;
sel<="0000000";
wait for 50 ns;
sel<="1010101";
wait for 50 ns;
sel<="1110111";
wait;
end process;
end Behavioral;

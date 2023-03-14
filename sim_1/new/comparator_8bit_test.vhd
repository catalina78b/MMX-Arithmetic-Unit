----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 06:58:11 PM
-- Design Name: 
-- Module Name: comparator_8bit_test - Behavioral
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

entity comparator_8bit_test is
--  Port ( );
end comparator_8bit_test;

architecture Behavioral of comparator_8bit_test is
component comparator_8bit is
Port (x,y:in std_logic_vector(7 downto 0);
      sm,eq,gt:out std_logic);
end component;
signal x,y: std_logic_vector(7 downto 0);
signal sm,eq,gt: std_logic;
begin
uut:comparator_8bit port map(x=>x,y=>y,sm=>sm,eq=>eq,gt=>gt);
process_stimulus:process
begin
x<="11111100";
y<="00000000";
wait for 50 ns;
x<="11111100";
y<="11111111";
wait for 50 ns;
x<="11111100";
y<="11111100";
wait;
end process;
end Behavioral;

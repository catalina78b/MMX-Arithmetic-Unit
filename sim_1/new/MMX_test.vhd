----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2022 11:47:17 AM
-- Design Name: 
-- Module Name: MMX_test - Behavioral
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

entity MMX_test is
--  Port ( );
end MMX_test;

architecture Behavioral of MMX_test is
component MMX is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           reset: in std_logic;
           btn:in std_logic;
           led: out std_logic_vector(15 downto 0);
           sw: inout STD_LOGIC_VECTOR (15 downto 0);
           an : inout STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end component;
signal clk,en,reset:std_logic;
signal an:std_logic_vector(3 downto 0);
signal led,sw:std_logic_vector(15 downto 0);
signal cat:std_logic_vector(6 downto 0);
begin
uut:MMX port map(clk=>clk,en=>en,reset=>reset,btn=>btn,an=>an,led=>led,sw=>sw,cat=>cat);
process_clk:process
begin
clk<='0';
wait for 50 ns;
clk<='1';
wait for 50 ns;
end process;
stimulus_process:process
begin
en<='1';
reset<='0';
sw<=X"0000";wait for 100 ns;
sw<=X"0001";wait for 100 ns;
sw<=X"0009";wait for 100 ns;
btn<="0001";
end process;

end Behavioral;

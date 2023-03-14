----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2022 12:24:43 AM
-- Design Name: 
-- Module Name: RAM - Behavioral
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
 Port ( ADDR: in std_logic_vector(2 downto 0); 
 ADDR_WR: in std_logic_vector(2 downto 0); 
 DATA_IN: in std_logic_vector(63 downto 0); 
 WR: in std_logic; 
 clk: in std_logic; 
 DATA_OUT: out std_logic_vector(63 downto 0));
end RAM;

architecture Behavioral of RAM is
type RAM_ARRAY is array (0 to 7) of std_logic_vector (63 downto 0);
signal RAM: RAM_ARRAY :=(
0=>X"FFFFFFFFFFFFFFFF",
1=>X"0000000000000007",
2=>X"1010101010101001",
3=>X"32FF00990101010C",
4=>X"11111100665AAAAA",
5=>X"FFFFFFFFFFFFFFFF",
6=>X"0000000000000002",
7=>X"1111111111111111");
begin
process(clk,wr)
begin
if clk'event and clk='1' then
   if wr='1' then
     RAM(to_integer(unsigned(ADDR_WR))) <= DATA_IN;
   end if;
end if;
end process;
DATA_OUT <= RAM(to_integer(unsigned(ADDR)));
end Behavioral;

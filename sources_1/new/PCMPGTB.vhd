----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 06:38:00 PM
-- Design Name: 
-- Module Name: PCMPGTB - Behavioral
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

entity PCMPGTB is
Port ( x,y:in std_logic_vector(63 downto 0);
       res:out std_logic_vector(63 downto 0));
end PCMPGTB;

architecture Behavioral of PCMPGTB is
component comparator_8bit is
Port (x,y:in std_logic_vector(7 downto 0);
      sm,eq,gt:out std_logic);
end component;
signal sm,eq,gt:std_logic_vector(7 downto 0):="00000000";
begin
--compara al doilea operand cu primul
--y>x greater
--y=x eq
--y<x smaller
process(gt,eq,sm)
begin
if gt(0)='1' then
  res(7 downto 0)<=X"FF";
elsif gt(0)='0' then
  res(7 downto 0)<=X"00";
end if;
if gt(1)='1' then
  res(15 downto 8)<=X"FF";
elsif gt(1)='0' then
  res(15 downto 8)<=X"00";
end if;
if gt(2)='1' then
  res(23 downto 16)<=X"FF";
elsif gt(2)='0' then
  res(23 downto 16)<=X"00";
end if;
if gt(3)='1' then
  res(31 downto 24)<=X"FF";
elsif gt(3)='0' then
  res(31 downto 24)<=X"00";
end if;
if gt(4)='1' then
  res(39 downto 32)<=X"FF";
elsif gt(4)='0' then
  res(39 downto 32)<=X"00";
end if;
if gt(5)='1' then
  res(47 downto 40)<=X"FF";
elsif gt(5)='0' then
  res(47 downto 40)<=X"00";
end if;
if gt(6)='1' then
  res(55 downto 48)<=X"FF";
elsif gt(6)='0' then
  res(55 downto 48)<=X"00";
end if;
if gt(7)='1' then
  res(63 downto 56)<=X"FF";
elsif gt(7)='0' then
  res(63 downto 56)<=X"00";
end if;
end process;
comp0:comparator_8bit port map(x=>x(7 downto 0),y=>y(7 downto 0),sm=>sm(0),eq=>eq(0),gt=>gt(0));
comp1:comparator_8bit port map(x=>x(15 downto 8),y=>y(15 downto 8),sm=>sm(1),eq=>eq(1),gt=>gt(1));
comp2:comparator_8bit port map(x=>x(23 downto 16),y=>y(23 downto 16),sm=>sm(2),eq=>eq(2),gt=>gt(2));
comp3:comparator_8bit port map(x=>x(31 downto 24),y=>y(31 downto 24),sm=>sm(3),eq=>eq(3),gt=>gt(3));
comp4:comparator_8bit port map(x=>x(39 downto 32),y=>y(39 downto 32),sm=>sm(4),eq=>eq(4),gt=>gt(4));
comp5:comparator_8bit port map(x=>x(47 downto 40),y=>y(47 downto 40),sm=>sm(5),eq=>eq(5),gt=>gt(5));
comp6:comparator_8bit port map(x=>x(55 downto 48),y=>y(55 downto 48),sm=>sm(6),eq=>eq(6),gt=>gt(6));
comp7:comparator_8bit port map(x=>x(63 downto 56),y=>y(63 downto 56),sm=>sm(7),eq=>eq(7),gt=>gt(7));
end Behavioral;

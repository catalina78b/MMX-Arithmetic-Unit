----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 12:13:39 AM
-- Design Name: 
-- Module Name: pack_8 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pack_8 is
Port ( x,y:in std_logic_vector(15 downto 0);
       sel:in std_logic;
      res:out std_logic_vector(7 downto 0));
end pack_8;

architecture Behavioral of pack_8 is
signal s:std_logic_vector(15 downto 0);
signal max_range_positive:std_logic_vector(7 downto 0):=X"7F";
signal max_range_negative:std_logic_vector(7 downto 0):=X"80";
begin
process(sel,x,y)
begin
case sel is
  when '0'=>s<=x;
  when '1'=>s<=y;
  when others=>s<="XXXXXXXXXXXXXXXX";
end case;
end process;
process(s)
begin
if (signed(s(15 downto 0))>=signed(max_range_positive) and s(15)='0') then
res(7 downto 0)<=max_range_positive;
elsif (signed(s(15 downto 0))<signed(max_range_positive) and s(15)='0') then
res(7 downto 0)<=s(7 downto 0);
end if;
if (signed(s(15 downto 0))>=signed(max_range_negative) and s(15)='1') then
res(7 downto 0)<=max_range_negative;
elsif (signed(s(15 downto 0))<signed(max_range_negative) and s(15)='1') then
res(7 downto 0)<=s(7 downto 0);
end if;
end process;
end Behavioral;

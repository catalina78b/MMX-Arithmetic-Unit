----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2022 04:38:55 PM
-- Design Name: 
-- Module Name: mux2_1 - Behavioral
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

entity mux2_1 is
Port ( i1,i2,s:in std_logic; 
       i3:out std_logic);
end mux2_1;

architecture Behavioral of mux2_1 is
signal ss:std_logic;
begin
process(s,ss,i1,i2)
begin
ss<=s;
if ss='0' then
   i3<=i1;
elsif ss='1' then
   i3<=i2;
end if;
end process;

end Behavioral;

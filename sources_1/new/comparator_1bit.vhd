----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 06:14:41 PM
-- Design Name: 
-- Module Name: comparator_1bit - Behavioral
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

entity comparator_1bit is
Port (x,y,gin,lin:in std_logic;
      eout,lout,gout:out std_logic );
end comparator_1bit;

--y>x greater

architecture Behavioral of comparator_1bit is
begin
lout<=(x and not y) or (x and gin) or (not y and gin);
eout<=(not x and not y and not gin and not lin) or (x and y and not gin and not lin);
gout<=(not x and y) or (not x and lin) or (y and lin);
end Behavioral;

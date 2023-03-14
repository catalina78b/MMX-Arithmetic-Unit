----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 12:25:55 AM
-- Design Name: 
-- Module Name: PXOR_test - Behavioral
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

entity PXOR_test is
--  Port ( );
end PXOR_test;

architecture Behavioral of PXOR_test is
component PXOR is
Port ( x,y:in std_logic_vector(63 downto 0);
       res:out std_logic_vector(63 downto 0));
end component;
signal x,y,res:std_logic_vector(63 downto 0);
begin
uut:PXOR port map(x=>x,y=>y,res=>res);
process_stimulus:process
begin
x<=X"FFFF1111FFF88900";
y<=X"FFFFFFFFFFFFFFFF";
wait;
end process;
end Behavioral;

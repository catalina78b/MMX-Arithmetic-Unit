----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 08:21:38 PM
-- Design Name: 
-- Module Name: PCMPGTB_test - Behavioral
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

entity PCMPGTB_test is
--  Port ( );
end PCMPGTB_test;

architecture Behavioral of PCMPGTB_test is
component PCMPGTB is
Port ( x,y:in std_logic_vector(63 downto 0);
       res:out std_logic_vector(63 downto 0));
end component;
signal x,y,res: std_logic_vector(63 downto 0);

begin
uut:PCMPGTB port map(x=>x,y=>y,res=>res);
process_stimlus:process
begin
x<=X"1111111111111111";
y<=X"0000001111111111";
wait for 50 ns;
x<=X"1111111111111111";
y<=X"1111111111111111";
wait for 50 ns;
x<=X"0011111111111111";
y<=X"1111111111111111";
wait;
end process;
end Behavioral;

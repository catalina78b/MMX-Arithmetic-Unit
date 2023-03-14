----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 11:07:58 PM
-- Design Name: 
-- Module Name: PACKSSWB_test - Behavioral
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

entity PACKSSWB_test is
--  Port ( );
end PACKSSWB_test;

architecture Behavioral of PACKSSWB_test is
component PACKSSWB is
Port ( x,y:in std_logic_vector(63 downto 0);
      res:inout std_logic_vector(63 downto 0));
end component;
signal x,y,res: std_logic_vector(63 downto 0);
begin
uut:PACKSSWB port map(x=>x,y=>y,res=>res);
stimulus_process:process
begin
x<=X"FFFFFFFFFFFFFFFF";
y<=X"0000000000000000";
wait for 100 ns;
x<=X"FFFFFFFFFFFFFFFF";
y<=X"0888888888888888";
wait;
end process;

end Behavioral;

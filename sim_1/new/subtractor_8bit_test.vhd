----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 02:44:20 PM
-- Design Name: 
-- Module Name: subtractor_8bit_test - Behavioral
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

entity subtractor_8bit_test is
--  Port ( );
end subtractor_8bit_test;

architecture Behavioral of subtractor_8bit_test is
component subtractor_8bit is
Port ( A,B : in std_logic_vector(7 downto 0);
C:in std_logic;
diff:out std_logic_vector(7 downto 0);
borrow : out std_logic);
end component;
signal A,B,diff : std_logic_vector(7 downto 0);
signal c,br:std_logic;
begin
uut:subtractor_8bit port map(A=>A,B=>B,C=>C,diff=>diff,borrow=>br);
process_stimulus:process
begin
A<="10101010";
B<="11111111";
c<='0';
wait;
end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2022 06:08:00 PM
-- Design Name: 
-- Module Name: shift_test - Behavioral
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

entity shift_test is
--  Port ( );
end shift_test;

architecture Behavioral of shift_test is
component shiftleft_8bit is
Port (clk,reset,en,sin:in std_logic;
      dout:out std_logic_vector(7 downto 0) );
end component;
signal sin,clk,reset:std_logic:='0';
signal en:std_logic:='1';
signal dout:std_logic_vector(7 downto 0):="00000000";
begin
uut:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>en,sin=>sin,dout=>dout);
clk_process:process
begin
clk<='0';
wait for 20 ns;
clk<='1';
wait for 20 ns;
end process;
stimulus_process:process
begin
sin<='1';
wait for 40 ns;
sin<='0';
wait for 40 ns;
sin<='1';
wait for 40 ns;
wait;
end process;
end Behavioral;

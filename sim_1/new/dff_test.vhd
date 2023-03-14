----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2022 06:57:46 PM
-- Design Name: 
-- Module Name: dff_test - Behavioral
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

entity dff_test is
--  Port ( );
end dff_test;

architecture Behavioral of dff_test is
component d_ff is
port(
clk : in STD_LOGIC;
din : in STD_LOGIC;
reset : in STD_LOGIC;
en : in STD_LOGIC;
dout : out STD_LOGIC
);
end component;
signal clk,din,reset,en:std_logic:='0';
signal dout:std_logic:='0';
begin
uut: d_ff PORT MAP (clk=>clk,reset=>reset,en=>en,din=>din,dout=>dout); 
clk_process:process
begin
clk<='0';
wait for 20 ns;
clk<='1';
wait for 20 ns;
end process;
stimulus_process:process
begin
en<='1';
din<='0';
wait for 40 ns;
din<='1';
wait for 40 ns;
din<='0';
wait for 40 ns;
din<='1';
wait for 40 ns;
end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 05:03:36 PM
-- Design Name: 
-- Module Name: shiftleft_8bit - Behavioral
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

entity shiftleft_8bit is
Port (clk,reset,en,sin:in std_logic;
      dout:out std_logic_vector(7 downto 0) );
end shiftleft_8bit;

architecture Behavioral of shiftleft_8bit is
component d_ff is
port(
clk : in STD_LOGIC;
din : in STD_LOGIC;
reset : in STD_LOGIC;
en : in STD_LOGIC;
dout : out STD_LOGIC
);
end component;
signal s:std_logic_vector(7 downto 0);
begin
dout<=s;
u0 : d_ff port map (clk => clk, din => sin, reset => reset,en=>en, dout => s(0));
u1 : d_ff port map (clk => clk, din => s(0), reset => reset,en=>en, dout => s(1));
u2 : d_ff port map (clk => clk, din => s(1), reset => reset,en=>en, dout => s(2));
u3 : d_ff port map (clk => clk, din => s(2), reset => reset,en=>en, dout => s(3));
u4 : d_ff port map (clk => clk, din => s(3), reset => reset,en=>en, dout => s(4));
u5 : d_ff port map (clk => clk, din => s(4), reset => reset,en=>en, dout => s(5));
u6 : d_ff port map (clk => clk, din => s(5), reset => reset,en=>en, dout => s(6));
u7 : d_ff port map (clk => clk, din => s(6), reset => reset,en=>en, dout => s(7));

end Behavioral;

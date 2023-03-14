----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 12:34:57 PM
-- Design Name: 
-- Module Name: xor_64bit - Behavioral
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

entity PXOR is
Port ( x,y:in std_logic_vector(63 downto 0);
       res:out std_logic_vector(63 downto 0));
end PXOR;

architecture Behavioral of PXOR is
component xor_gate is
Port ( x,y:in std_logic;
       z:out std_logic);
end component;
begin
mapping:for i in 0 to 63 generate
xor_instantiate:xor_gate port map(x=>x(i),y=>y(i),z=>res(i));
end generate;
end Behavioral;

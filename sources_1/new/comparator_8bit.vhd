----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 06:18:21 PM
-- Design Name: 
-- Module Name: comparator_8bit - Behavioral
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

entity comparator_8bit is
Port (x,y:in std_logic_vector(7 downto 0);
      sm,eq,gt:out std_logic);
end comparator_8bit;

architecture Behavioral of comparator_8bit is
component comparator_1bit is
Port (x,y,gin,lin:in std_logic;
      eout,lout,gout:out std_logic );
end component;
signal g,l,e:std_logic_vector(8 downto 0);
begin
g(0)<='0';
l(0)<='0';
mapping:for i in 0 to 7 generate
comp: comparator_1bit port map(x=>x(i),y=>y(i),gin=>g(i),lin=>l(i),eout=>e(i+1),lout=>l(i+1),gout=>g(i+1));
end generate;
gt<=g(7);
sm<=l(7);
eq<=e(7);
end Behavioral;

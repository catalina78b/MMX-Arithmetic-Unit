----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 10:57:06 AM
-- Design Name: 
-- Module Name: Adder_8bits - Behavioral
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

entity adder_8bit is
Port (x,y : in std_logic_vector(7 downto 0);
      cin : in std_logic;
      s : out std_logic_vector(7 downto 0);
      cout : out std_logic);
end adder_8bit;

architecture Behavioral of adder_8bit is
component full_adder is
Port ( x,y:in std_logic;
      cin:in std_logic;
      s,cout:out std_logic);
end component;
signal carry : std_logic_vector(6 downto 0);
begin
     a0:full_adder port map (x=>x(0),y=>y(0),cin=>cin,s=>s(0),cout=>carry(0));
     a1:full_adder port map (x=>x(1),y=>y(1),cin=>carry(0),s=>s(1),cout=>carry(1));
     a2:full_adder port map (x=>x(2),y=>y(2),cin=>carry(1),s=>s(2),cout=>carry(2));
     a3:full_adder port map (x=>x(3),y=>y(3),cin=>carry(2),s=>s(3),cout=>carry(3));
     a4:full_adder port map (x=>x(4),y=>y(4),cin=>carry(3),s=>s(4),cout=>carry(4));
     a5:full_adder port map (x=>x(5),y=>y(5),cin=>carry(4),s=>s(5),cout=>carry(5));
     a6:full_adder port map (x=>x(6),y=>y(6),cin=>carry(5),s=>s(6),cout=>carry(6));
     a7:full_adder port map (x=>x(7),y=>y(7),cin=>carry(6),s=>s(7),cout=>cout);


end Behavioral;

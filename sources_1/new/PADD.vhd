----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2022 03:59:38 PM
-- Design Name: 
-- Module Name: PADD - Behavioral
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

entity PADD is
Port (x,y:in std_logic_vector(63 downto 0);
      sel:in std_logic_vector(6 downto 0);
      res:out std_logic_vector(63 downto 0));
end PADD;

architecture Behavioral of PADD is
component adder_8bit is
Port (x,y : in std_logic_vector(7 downto 0);
      cin : in std_logic;
      s : out std_logic_vector(7 downto 0);
      cout : out std_logic);
end component;
component mux2_1 is
Port ( i1,i2,s:in std_logic; 
       i3:out std_logic);
end component;
signal cout:std_logic_vector(7 downto 0);
signal mux_out:std_logic_vector(6 downto 0);
begin
add8bit0:adder_8bit port map(x=>x(7 downto 0),y=>y(7 downto 0),cin=>'0',s=>res(7 downto 0),cout=>cout(0));
mux0:mux2_1 port map(i1=>'0',i2=>cout(0),s=>sel(0),i3=>mux_out(0));
add8bit1:adder_8bit port map(x=>x(15 downto 8),y=>y(15 downto 8),cin=>mux_out(0),s=>res(15 downto 8),cout=>cout(1));
mux1:mux2_1 port map(i1=>'0',i2=>cout(1),s=>sel(1),i3=>mux_out(1));
add8bit2:adder_8bit port map(x=>x(23 downto 16),y=>y(23 downto 16),cin=>mux_out(1),s=>res(23 downto 16),cout=>cout(2));
mux2:mux2_1 port map(i1=>'0',i2=>cout(2),s=>sel(2),i3=>mux_out(2));
add8bit3:adder_8bit port map(x=>x(31 downto 24),y=>y(31 downto 24),cin=>mux_out(2),s=>res(31 downto 24),cout=>cout(3));
mux3:mux2_1 port map(i1=>'0',i2=>cout(3),s=>sel(3),i3=>mux_out(3));
add8bit4:adder_8bit port map(x=>x(39 downto 32),y=>y(39 downto 32),cin=>mux_out(3),s=>res(39 downto 32),cout=>cout(4));
mux4:mux2_1 port map(i1=>'0',i2=>cout(4),s=>sel(4),i3=>mux_out(4));
add8bit5:adder_8bit port map(x=>x(47 downto 40),y=>y(47 downto 40),cin=>mux_out(4),s=>res(47 downto 40),cout=>cout(5));
mux5:mux2_1 port map(i1=>'0',i2=>cout(5),s=>sel(5),i3=>mux_out(5));
add8bit6:adder_8bit port map(x=>x(55 downto 48),y=>y(55 downto 48),cin=>mux_out(5),s=>res(55 downto 48),cout=>cout(6));
mux6:mux2_1 port map(i1=>'0',i2=>cout(6),s=>sel(6),i3=>mux_out(6));
add8bit7:adder_8bit port map(x=>x(63 downto 56),y=>y(63 downto 56),cin=>mux_out(6),s=>res(63 downto 56),cout=>cout(7));
end Behavioral;

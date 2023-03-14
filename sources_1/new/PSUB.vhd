----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2022 05:15:32 PM
-- Design Name: 
-- Module Name: PSUB - Behavioral
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

entity PSUB is
Port (x,y:in std_logic_vector(63 downto 0);
      sel:in std_logic_vector(6 downto 0);
      res:out std_logic_vector(63 downto 0) );
end PSUB;

architecture Behavioral of PSUB is
component subtractor_8bit is
Port ( A,B : in std_logic_vector(7 downto 0);
C:in std_logic;
diff:out std_logic_vector(7 downto 0);
borrow : out std_logic);
end component;
component mux2_1 is
Port ( i1,i2,s:in std_logic; 
       i3:out std_logic);
end component;
signal br:std_logic_vector(7 downto 0);
signal mux_out:std_logic_vector(6 downto 0);
begin
subtractor0:subtractor_8bit port map(a=>x(7 downto 0),b=>y(7 downto 0),c=>'0',diff=>res(7 downto 0),borrow=>br(0));
mux0:mux2_1 port map(i1=>'0',i2=>br(0),s=>sel(0),i3=>mux_out(0));
subtractor1:subtractor_8bit port map(a=>x(15 downto 8),b=>y(15 downto 8),c=>mux_out(0),diff=>res(15 downto 8),borrow=>br(1));
mux1:mux2_1 port map(i1=>'0',i2=>br(1),s=>sel(1),i3=>mux_out(1));
subtractor2:subtractor_8bit port map(a=>x(23 downto 16),b=>y(23 downto 16),c=>mux_out(1),diff=>res(23 downto 16),borrow=>br(2));
mux2:mux2_1 port map(i1=>'0',i2=>br(2),s=>sel(2),i3=>mux_out(2));
subtractor3:subtractor_8bit port map(a=>x(31 downto 24),b=>y(31 downto 24),c=>mux_out(2),diff=>res(31 downto 24),borrow=>br(3));
mux3:mux2_1 port map(i1=>'0',i2=>br(3),s=>sel(3),i3=>mux_out(3));
subtractor4:subtractor_8bit port map(a=>x(39 downto 32),b=>y(39 downto 32),c=>mux_out(3),diff=>res(39 downto 32),borrow=>br(4));
mux4:mux2_1 port map(i1=>'0',i2=>br(4),s=>sel(4),i3=>mux_out(4));
subtractor5:subtractor_8bit port map(a=>x(47 downto 40),b=>y(47 downto 40),c=>mux_out(4),diff=>res(47 downto 40),borrow=>br(5));
mux5:mux2_1 port map(i1=>'0',i2=>br(5),s=>sel(5),i3=>mux_out(5));
subtractor6:subtractor_8bit port map(a=>x(55 downto 48),b=>y(55 downto 48),c=>mux_out(5),diff=>res(55 downto 48),borrow=>br(6));
mux6:mux2_1 port map(i1=>'0',i2=>br(6),s=>sel(6),i3=>mux_out(6));
subtractor7:subtractor_8bit port map(a=>x(63 downto 56),b=>y(63 downto 56),c=>mux_out(6),diff=>res(63 downto 56),borrow=>br(7));
end Behavioral;

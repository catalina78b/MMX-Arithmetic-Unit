----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2022 06:07:34 PM
-- Design Name: 
-- Module Name: PSLL - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSLL is
Port (x,y:in std_logic_vector(63 downto 0);
      sel:in std_logic_vector(6 downto 0);
      clk,reset,en:in std_logic;
      res:inout std_logic_vector(63 downto 0) );
end PSLL;

architecture Behavioral of PSLL is
component shiftleft_8bit is
Port (clk,reset,en,sin:in std_logic;
      dout:out std_logic_vector(7 downto 0) );
end component;
component mux2_1 is
Port ( i1,i2,s:in std_logic; 
       i3:out std_logic);
end component;
signal mux_out:std_logic_vector(6 downto 0);
signal sin:std_logic;
signal i:integer:=0;
signal j:integer:=0;
signal enable:std_logic_vector(7 downto 0):="11111111";
signal sell:std_logic_vector(6 downto 0);
begin
process(sel,i,j)
begin
sell<="1111111";
if i>63 and j>0 then
sell<=sel;
end if;
end process;
--x operandul sursa (count)
--y operandul destinatie
process(clk)
begin  
  if clk'event and clk='1' then
   if en='1' then
     if i<64 then
       sin<=y(i);
       i<=i+1;
     elsif j<to_integer(unsigned(x)) then
       sin<='0';
       j<=j+1;
     else
       enable<="00000000";
     end if;
     else
       i<=0;
       j<=0;
       enable<="11111111";
    end if;
  end if;
end process;
sll0:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>enable(0),sin=>sin,dout=>res(7 downto 0));
mux0:mux2_1 port map(i1=>'0',i2=>res(7),s=>sell(0),i3=>mux_out(0));
sll1:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>enable(1),sin=>mux_out(0),dout=>res(15 downto 8));
mux1:mux2_1 port map(i1=>'0',i2=>res(15),s=>sell(1),i3=>mux_out(1));
sll2:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>enable(2),sin=>mux_out(1),dout=>res(23 downto 16));
mux2:mux2_1 port map(i1=>'0',i2=>res(23),s=>sell(2),i3=>mux_out(2));
sll3:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>enable(3),sin=>mux_out(2),dout=>res(31 downto 24));
mux3:mux2_1 port map(i1=>'0',i2=>res(31),s=>sell(3),i3=>mux_out(3));
sll4:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>enable(4),sin=>mux_out(3),dout=>res(39 downto 32));
mux4:mux2_1 port map(i1=>'0',i2=>res(39),s=>sell(4),i3=>mux_out(4));
sll5:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>enable(5),sin=>mux_out(4),dout=>res(47 downto 40));
mux5:mux2_1 port map(i1=>'0',i2=>res(47),s=>sell(5),i3=>mux_out(5));
sll6:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>enable(6),sin=>mux_out(5),dout=>res(55 downto 48));
mux6:mux2_1 port map(i1=>'0',i2=>res(55),s=>sell(6),i3=>mux_out(6));
sll7:shiftleft_8bit port map(clk=>clk,reset=>reset,en=>enable(7),sin=>mux_out(6),dout=>res(63 downto 56));
end Behavioral;

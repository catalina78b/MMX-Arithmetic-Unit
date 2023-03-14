----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 11:53:49 PM
-- Design Name: 
-- Module Name: MMX - Behavioral
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

entity MMX is
    Port ( clk : in STD_LOGIC;
           btn,btn1:in std_logic;
           led: out std_logic_vector(15 downto 0);
           sw: inout STD_LOGIC_VECTOR (15 downto 0);
           an : inout STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end MMX;

architecture Behavioral of MMX is
component MPG is
    Port ( input : in STD_LOGIC;
           clock : in STD_LOGIC;
           enable : inout STD_LOGIC);
end component;
component RAM is
 Port ( ADDR: in std_logic_vector(2 downto 0); 
 ADDR_WR: in std_logic_vector(2 downto 0); 
 DATA_IN: in std_logic_vector(63 downto 0); 
 WR: in std_logic; 
 clk: in std_logic; 
 DATA_OUT: out std_logic_vector(63 downto 0));
end component;
component PADD is
Port (x,y:in std_logic_vector(63 downto 0);
      sel:in std_logic_vector(6 downto 0);
      res:out std_logic_vector(63 downto 0));
end component;
component PSUB is
Port (x,y:in std_logic_vector(63 downto 0);
      sel:in std_logic_vector(6 downto 0);
      res:out std_logic_vector(63 downto 0) );
end component;
component PSLL is
Port (x,y:in std_logic_vector(63 downto 0);
      sel:in std_logic_vector(6 downto 0);
      clk,reset,en:in std_logic;
      res:inout std_logic_vector(63 downto 0) );
end component;
component PXOR is
Port ( x,y:in std_logic_vector(63 downto 0);
       res:out std_logic_vector(63 downto 0));
end component;
component PCMPGTB is
Port ( x,y:in std_logic_vector(63 downto 0);
       res:out std_logic_vector(63 downto 0));
end component;
component PACKSSWB is
Port ( x,y:in std_logic_vector(63 downto 0);
      res:inout std_logic_vector(63 downto 0));
end component;
component SSD is
    Port ( d:in std_logic_vector(15 downto 0);
           clk:in std_logic;
           an : inout STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end component;
component dmux2_1 is
Port (F:in std_logic_vector(63 downto 0);
      S:in std_logic;
      A,B:out std_logic_vector(63 downto 0));
end component;
component reg is
Port (data_in:in std_logic_vector(63 downto 0);
      data_out:out std_logic_vector(63 downto 0);
      en,clk:in std_logic
      );
end component;
component ControlUnit is
Port (  
sw: in STD_LOGIC_VECTOR (15 downto 0);
res1,res2,res3,res4,res5,res6:in STD_LOGIC_VECTOR (63 downto 0);
result:out STD_LOGIC_VECTOR (63 downto 0);
sel:out STD_LOGIC_VECTOR (6 downto 0);
clk:in std_logic;
btn_en1:in std_logic;
s:inout std_logic;
en_src,en_dest:out std_logic;
wr,en_shift:out std_logic;
addr_op1:out std_logic_vector(2 downto 0);
addr:inout std_logic_vector(2 downto 0));
end component;
component DisplayControl is
Port (sw: in STD_LOGIC_VECTOR (15 downto 0);
data,op1,op2,result:in STD_LOGIC_VECTOR (63 downto 0);
d:out std_logic_vector (15 downto 0);
clk:in std_logic;
btn_en:in std_logic );
end component;

signal dd,op1,opp1,op2,opp2,data,result,res1,res2,res3,res4,res5,res6:std_logic_vector(63 downto 0);
signal addr,addr_op1:std_logic_vector(2 downto 0);
signal sel:std_logic_vector(6 downto 0);
signal s:std_logic:='0'; --selectie dmux
signal wr,en_shift:std_logic;
signal enable,rst,btn_en,btn_en1,en_src,en_dest,en_res:std_logic;
signal d:std_logic_vector(15 downto 0);
signal cnt:std_logic_vector(1 downto 0):="00";

begin
mpg1:MPG port map(input=>btn,clock=>clk,enable=>btn_en);
mpg2:MPG port map(input=>btn1,clock=>clk,enable=>btn_en1);
ram_mapping:ram port map(addr=>addr,addr_wr=>addr_op1,data_in=>result,wr=>wr,clk=>clk,data_out=>data);
dmux_mapping:dmux2_1 port map(F=>data,S=>S,A=>opp1,B=>opp2);
reg_mapping1:reg port map(data_in=>opp1,clk=>clk,en=>en_src,data_out=>op1);
reg_mapping2:reg port map(data_in=>opp2,clk=>clk,en=>en_dest,data_out=>op2);
padd_mapping:padd port map(x=>op1,y=>op2,sel=>sel,res=>res1);
psub_mapping:psub port map(x=>op1,y=>op2,sel=>sel,res=>res2);
pxor_mapping:pxor port map(x=>op1,y=>op2,res=>res3);
psll_mapping:psll port map(clk=>clk,reset=>rst,en=>en_shift,x=>op1,y=>op2,sel=>sel,res=>res4);
pcmpgtb_mapping:pcmpgtb port map(x=>op1,y=>op2,res=>res5);
packsswb_mapping:packsswb port map(x=>op1,y=>op2,res=>res6);
controlunit_mapping:ControlUnit port map(sw=>sw,res1=>res1,res2=>res2,res3=>res3,res4=>res4,res5=>res5,res6=>res6,
result=>result,sel=>sel,clk=>clk,s=>s,en_dest=>en_dest,en_src=>en_src,btn_en1=>btn_en1,wr=>wr,en_shift=>en_shift,addr_op1=>addr_op1,addr=>addr);
displaycontrol_mapping:DisplayControl port map(sw=>sw,data=>data,op1=>op1,op2=>op2,result=>result,
d=>d,clk=>clk,btn_en=>btn_en);
ssd_mapping:ssd port map(d=>d,clk=>clk,an=>an,cat=>cat);
end Behavioral;

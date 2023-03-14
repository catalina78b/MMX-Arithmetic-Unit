----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2022 03:08:48 PM
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
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
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
--primul operand sursa, al doilea operand destinatia
--rezultatul se scrie in destinatie
process(clk,s,btn_en1,addr)
begin
en_dest<='0';
en_src<='0';
if clk'event and clk='1' then
  if btn_en1='1' then
    if s='1' then
      s<='0';en_dest<='1';addr_op1<=addr;
    else
      s<='1';en_src<='1';
    end if;
  end if;
end if;
end process;

process(sw(4 downto 0))
begin
wr<='0';
en_shift<='0';
result<=X"0000000000000000";
sel<="0000000";
case sw(4 downto 0) is
    when "00000"=>addr<="000"; --mm1
    when "00001"=>addr<="001"; --mm2
    when "00010"=>addr<="010"; --mm3
    when "00011"=>addr<="011"; --mm4
    when "00100"=>addr<="100"; --mm5
    when "00101"=>addr<="101"; --mm6
    when "00110"=>addr<="110"; --mm7
    when "00111"=>addr<="111"; --mm8
    when "01000"=>result<=res1;sel<="0000000";wr<='1'; --PADDB
    when "01001"=>result<=res1;sel<="1010101";wr<='1'; --PADDW
    when "01010"=>result<=res1;sel<="1110111";wr<='1'; --PADDD
    when "01011"=>result<=res1;sel<="1111111";wr<='1'; --PADDQ
    when "01100"=>result<=res2;sel<="0000000";wr<='1'; --PSUBB
    when "01101"=>result<=res2;sel<="1010101";wr<='1'; --PSUBW
    when "01110"=>result<=res2;sel<="1110111";wr<='1'; --PSUBD
    when "01111"=>result<=res2;sel<="1111111";wr<='1'; --PSUBQ
    when "10000"=>result<=res3;wr<='1';                --PXOR
    when "10001"=>result<=res4;sel<="0000000";wr<='1';en_shift<='1';--PSLLB
    when "10010"=>result<=res4;sel<="1010101";wr<='1';en_shift<='1';--PSLLW
    when "10011"=>result<=res4;sel<="1110111";wr<='1';en_shift<='1';--PSLLD
    when "10100"=>result<=res4;sel<="1111111";wr<='1';en_shift<='1';--PSLLQ
    when "10101"=>result<=res5;wr<='1';               --PCMPGTB
    when "10110"=>result<=res6;wr<='1';               --PACKSSWB
    when others=>result<=X"0000000000000000";
end case;
end process;


end Behavioral;

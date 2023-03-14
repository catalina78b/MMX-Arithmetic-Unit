----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/05/2023 08:45:58 PM
-- Design Name: 
-- Module Name: DisplayControl - Behavioral
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

entity DisplayControl is
Port (sw: in STD_LOGIC_VECTOR (15 downto 0);
data,op1,op2,result:in STD_LOGIC_VECTOR (63 downto 0);
d:out std_logic_vector (15 downto 0);
clk:in std_logic;
btn_en:in std_logic );
end DisplayControl;

architecture Behavioral of DisplayControl is
signal dd:STD_LOGIC_VECTOR (63 downto 0);
signal cnt:STD_LOGIC_VECTOR (1 downto 0);
begin
process(sw(15 downto 14))
begin
 case sw(15 downto 14) is
     when "00"=>dd<=data;
     when "01"=>dd<=op1;--sursa
     when "10"=>dd<=op2;--dest
     when "11"=>dd<=result;
     when others=>
end case;   
end process;
process(clk,btn_en)
begin
if clk'event and clk='1' then
  if btn_en='1' then
    if cnt="11" then
      cnt<="00";
    else
      cnt<=cnt+1;
  end if;
end if;
end if;
end process;
process(cnt)
begin
case cnt is
   when "00"=>d<=dd(15 downto 0);
   when "01"=>d<=dd(31 downto 16);
   when "10"=>d<=dd(47 downto 32);
   when "11"=>d<=dd(63 downto 48);
end case;  
end process;

end Behavioral;

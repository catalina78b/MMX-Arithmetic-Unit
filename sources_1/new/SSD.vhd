----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/18/2022 12:11:41 AM
-- Design Name: 
-- Module Name: SSD - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSD is
    Port ( d:in std_logic_vector(15 downto 0);
           clk:in std_logic;
           an : inout STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end SSD;

architecture Behavioral of SSD is
signal cnt:std_logic_vector(15 downto 0):=x"0000";
signal s:std_logic_vector(3 downto 0);

begin
process(clk)
begin
if clk'event and clk='1' then
cnt<=cnt+1;
end if;
end process;

process(clk)
begin
case cnt(15 downto 14) is
    when "00" =>s<=d(3 downto 0);
    when "01" =>s<=d(7 downto 4);
    when "10" =>s<=d(11 downto 8);
    when "11" =>s<=d(15 downto 12);
    when others=>
end case;
end process;

process(clk)
begin
case cnt(15 downto 14) is
when "00" =>an<="1110";
when "01" =>an<="1101";
when "10" =>an<="1011";
when "11" =>an<="0111";
when others=>
end case;
end process;

process(s)
begin
case s is            
			 when X"0" => cat <= "1000000";
			 when X"1" => cat <= "1111001"; 
			 when X"2" => cat <= "0100100"; 
			 when X"3" => cat <= "0110000"; 
			 when X"4" => cat <= "0011001"; 
			 when X"5" => cat <= "0010010"; 
			 when X"6" => cat <= "0000010"; 
			 when X"7" => cat <= "1111000"; 
			 when X"8" => cat <= "0000000"; 
			 when X"9" => cat <= "0010000"; 
			 when X"A" => cat <= "0001000"; 
			 when X"B" => cat <= "0000011"; 
			 when X"C" => cat <= "1000110"; 
			 when X"D" => cat <= "0100001"; 
			 when X"E" => cat <= "0000110"; 
			 when X"F" => cat <= "0001110"; 
			 when others => cat <= "0111111"; 
		end case;
end process;

end Behavioral;

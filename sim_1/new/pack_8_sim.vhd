----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 09:38:32 PM
-- Design Name: 
-- Module Name: pack_8_sim - Behavioral
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

entity pack_8_sim is
--  Port ( );
end pack_8_sim;

architecture Behavioral of pack_8_sim is
component pack_8 is
Port ( x,y:in std_logic_vector(15 downto 0);
       sel:in std_logic;
      res:out std_logic_vector(7 downto 0));
end component;
signal x,y: std_logic_vector(15 downto 0);
signal sel:std_logic;
signal res: std_logic_vector(7 downto 0);
begin
uut:pack_8 port map(x=>x,y=>y,sel=>sel,res=>res);
stimulus_process:process
begin
x<=X"9000";
y<=X"007F";
sel<='1';
wait for 50 ns;
sel<='0';
wait;
end process;

end Behavioral;

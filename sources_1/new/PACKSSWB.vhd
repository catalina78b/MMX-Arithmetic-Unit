----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2022 11:53:58 PM
-- Design Name: 
-- Module Name: PACKSSWB - Behavioral
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

entity PACKSSWB is
Port ( x,y:in std_logic_vector(63 downto 0);
      res:inout std_logic_vector(63 downto 0));
end PACKSSWB;

architecture Behavioral of PACKSSWB is
component pack_8 is
Port ( x,y:in std_logic_vector(15 downto 0);
       sel:in std_logic;
      res:out std_logic_vector(7 downto 0));
end component;
begin
--prima data y(destinatia), apoi x(sursa)
pack0:pack_8 port map(x=>x(15 downto 0),y=>y(15 downto 0),sel=>'1',res=>res(7 downto 0));
pack1:pack_8 port map(x=>x(31 downto 16),y=>y(31 downto 16),sel=>'1',res=>res(15 downto 8));
pack2:pack_8 port map(x=>x(47 downto 32),y=>y(47 downto 32),sel=>'1',res=>res(23 downto 16));
pack3:pack_8 port map(x=>x(63 downto 48),y=>y(63 downto 48),sel=>'1',res=>res(31 downto 24));
pack4:pack_8 port map(x=>x(15 downto 0),y=>y(15 downto 0),sel=>'0',res=>res(39 downto 32));
pack5:pack_8 port map(x=>x(31 downto 16),y=>y(31 downto 16),sel=>'0',res=>res(47 downto 40));
pack6:pack_8 port map(x=>x(47 downto 32),y=>y(47 downto 32),sel=>'0',res=>res(55 downto 48));
pack7:pack_8 port map(x=>x(63 downto 48),y=>y(63 downto 48),sel=>'0',res=>res(63 downto 56));
end Behavioral;

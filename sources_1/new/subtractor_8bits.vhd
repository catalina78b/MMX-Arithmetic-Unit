----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 12:09:48 PM
-- Design Name: 
-- Module Name: subtractor_8bits - Behavioral
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

entity subtractor_8bit is
Port ( A,B : in std_logic_vector(7 downto 0);
C:in std_logic;
diff:out std_logic_vector(7 downto 0);
borrow : out std_logic);
end subtractor_8bit;

architecture Behavioral of subtractor_8bit is
component full_subtractor is
Port ( A,B,C : in std_logic;
diff, borrow : out std_logic);
end component;
signal br:std_logic_vector(6 downto 0);
begin
s0:full_subtractor port map(a=>a(0),b=>b(0),c=>c,diff=>diff(0),borrow=>br(0));
s1:full_subtractor port map(a=>a(1),b=>b(1),c=>br(0),diff=>diff(1),borrow=>br(1));
s2:full_subtractor port map(a=>a(2),b=>b(2),c=>br(1),diff=>diff(2),borrow=>br(2));
s3:full_subtractor port map(a=>a(3),b=>b(3),c=>br(2),diff=>diff(3),borrow=>br(3));
s4:full_subtractor port map(a=>a(4),b=>b(4),c=>br(3),diff=>diff(4),borrow=>br(4));
s5:full_subtractor port map(a=>a(5),b=>b(5),c=>br(4),diff=>diff(5),borrow=>br(5));
s6:full_subtractor port map(a=>a(6),b=>b(6),c=>br(5),diff=>diff(6),borrow=>br(6));
s7:full_subtractor port map(a=>a(7),b=>b(7),c=>br(6),diff=>diff(7),borrow=>borrow);
end Behavioral;

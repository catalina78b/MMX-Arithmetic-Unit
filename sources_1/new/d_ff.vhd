----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2022 07:32:50 PM
-- Design Name: 
-- Module Name: d_ff - Behavioral
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

entity d_ff is
port(
clk : in STD_LOGIC;
din : in STD_LOGIC;
reset : in STD_LOGIC;
en : in STD_LOGIC;
dout : out STD_LOGIC
);
end d_ff;

architecture behave of d_ff is
begin
process(clk,reset,en,din)
begin
  if (reset='1') then
    dout <= '0';
  elsif clk'event and clk='1' then
    if en='1' then
      dout <= din;
    end if;
  end if ;
end process ;
end behave;
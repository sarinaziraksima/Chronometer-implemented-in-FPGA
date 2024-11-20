----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2024 12:17:14 PM
-- Design Name: 
-- Module Name: sevenseg_conditions - Behavioral
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

entity sevenseg_conditions is
    Port ( hex : in STD_LOGIC_VECTOR (3 downto 0);
           dot : in STD_LOGIC;
           en : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (7 downto 0)
           );
end sevenseg_conditions;

architecture Behavioral of sevenseg_conditions is
signal val:std_logic_vector(7 downto 0);
begin

with hex select
    val <= X"C0" when "0000",
                      X"F9" when "0001",
                      X"A4" when "0010",
                      X"B0" when "0011",
                      X"99" when "0100",
                      X"92" when "0101",
                      X"82" when "0110",
                      X"F8" when "0111",
                      X"80" when "1000",
                      X"90" when "1001",
                      X"A3" when "1010",
                      X"83" when "1011",
                      X"A7" when "1100",
                      X"A1" when "1101",
                      X"86" when "1110",
                      X"AE" when "1111";
    seg(6 downto 0) <= val(6 downto 0);
	seg(7) <= dot;
	
	


end Behavioral;

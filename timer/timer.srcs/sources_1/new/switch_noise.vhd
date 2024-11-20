----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2024 11:03:55 AM
-- Design Name: 
-- Module Name: switch_noise - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity switch_noise is
    Port ( i_s : in STD_LOGIC;
           clk : in STD_LOGIC;
           o_s : out STD_LOGIC);
end switch_noise;

architecture Behavioral of switch_noise is
constant delayss: integer:=25000;
signal counting: unsigned(23 downto 0);

begin



process (i_s)
begin
    o_s <= '0';
    if i_s='0' then
    counting <= counting+1;
    elsif i_s='1' then
    counting <= (others=>'0');
    end if;
    
    if counting > delayss then
        o_s <= '1';
        counting <= (others=>'0');
    end if;
end process;
end Behavioral;













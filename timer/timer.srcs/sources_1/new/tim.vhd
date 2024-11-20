----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2024 11:41:10 AM
-- Design Name: 
-- Module Name: tim - Behavioral
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

entity tim is
    Port ( clk : in STD_LOGIC;
           go : in STD_LOGIC;
           clr : in STD_LOGIC;
           d4 : out STD_LOGIC_VECTOR (3 downto 0);
           d3 : out STD_LOGIC_VECTOR (3 downto 0);
           d2 : out STD_LOGIC_VECTOR (3 downto 0);
           d1 : out STD_LOGIC_VECTOR (3 downto 0);
           d0 : out STD_LOGIC_VECTOR (3 downto 0));
           
end tim;

architecture Behavioral of tim is

constant DVSR: integer:=2500000;
signal ms_reg, ms_next: unsigned(23 downto 0);
signal d4_reg, d4_next: unsigned(3 downto 0);
signal d3_reg, d3_next: unsigned(3 downto 0);
signal d2_reg, d2_next: unsigned(3 downto 0);
signal d1_reg, d1_next: unsigned(3 downto 0);
signal d0_reg, d0_next: unsigned(3 downto 0);
signal d0_en, d1_en, d2_en, d3_en, d4_en: std_logic;
signal ms_tick, d0_tick, d1_tick, d2_tick, d3_tick: std_logic;


begin


process(clk)
begin
    
    if(clk'event and clk='1') then 
        
        ms_reg <= ms_next;
        d4_reg <= d4_next;
        d3_reg <= d3_next;
        d2_reg <= d2_next;
        d1_reg <= d1_next;
        d0_reg <= d0_next;
        
        
        
    end if;
    

end process;

------ next state logic

-- 0.1 sec tick generator

ms_next <= (others=>'0') when clr='1' or (ms_reg=DVSR and go='1') else
            ms_reg+1 when go='1' else
            ms_reg;
ms_tick <= '1' when ms_reg=DVSR else '0';

-- 0.1 sec counter

d0_en <= '1' when ms_tick='1' else '0';
d0_next <= "0000" when clr='1' or (d0_en='1' and d0_reg=9) else
            d0_reg+1 when d0_en='1' else
            d0_reg;
d0_tick <= '1' when d0_reg=9 else '0';


-- 1 sec counter

d1_en <= '1' when ms_tick='1' and d0_tick='1' else '0';
d1_next <= "0000" when clr='1' or (d1_en='1' and d1_reg=9) else
            d1_reg+1 when d1_en='1' else
            d1_reg;
d1_tick <= '1' when d1_reg=9 else '0';


-- 10 sec counter

d2_en <= '1' when ms_tick='1' and d0_tick='1' and d1_tick='1' else '0';
d2_next <= "0000" when clr='1' or (d2_en='1' and d2_reg=9) else
            d2_reg+1 when d2_en='1' else
            d2_reg;
d2_tick <= '1' when d2_reg=9 else '0';


-- 100 sec counter

d3_en <= '1' when ms_tick='1' and d0_tick='1' and d1_tick='1' and d2_tick='1' else '0';
d3_next <= "0000" when clr='1' or (d3_en='1' and d3_reg=9) else
            d3_reg+1 when d3_en='1' else
            d3_reg;
d3_tick <= '1' when d3_reg=9 else '0';


-- 1000 sec counter

d4_en <= '1' when ms_tick='1' and d0_tick='1' and d1_tick='1' and d2_tick='1' and d3_tick='1' else '0';
d4_next <= "0000" when clr='1' or (d4_en='1' and d4_reg=9) else
            d4_reg+1 when d4_en='1' else
            d4_reg;
--d4_tick <= '1' when d4_reg=9 else '0';

-- outputs

d0 <= std_logic_vector(d0_reg);
d1 <= std_logic_vector(d1_reg);
d2 <= std_logic_vector(d2_reg);
d3 <= std_logic_vector(d3_reg);
d4 <= std_logic_vector(d4_reg);


end Behavioral;

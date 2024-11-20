----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 03:15:03 AM
-- Design Name: 
-- Module Name: test_4segs - Behavioral
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

entity test_4segs is
    Port ( in0 : IN std_logic_vector(3 downto 0);
	    in1 : IN std_logic_vector(3 downto 0);
	    in2 : IN std_logic_vector(3 downto 0);
	    in3 : IN std_logic_vector(3 downto 0);	    
		clk : IN std_logic;
		dot : IN std_logic_vector(3 downto 0);
		en : OUT std_logic_vector(3 downto 0);          
		seg : OUT std_logic_vector(7 downto 0));
		
		
end test_4segs;

architecture Behavioral of test_4segs is

COMPONENT sevenseg_conditions
	Port ( hex : in STD_LOGIC_VECTOR (3 downto 0);
           dot : in STD_LOGIC;
           en : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (7 downto 0)
           );
END COMPONENT;



signal s_clk: unsigned(16 downto 0);
signal s0,s1,s2,s3: std_logic_vector(7 downto 0);


begin

process(clk)
begin
    if rising_edge(clk) then
        s_clk <= s_clk + 1;
    end if;
end process;

with s_clk(16 downto 15) select
    en <= "1110" when "00",
          "1101" when "01",
          "1011" when "10",
          "0111" when others;
          
 

seg0: sevenseg_conditions PORT MAP(
	       hex =>in0,
           dot =>dot(0),
           en => en(0),
           seg =>s0
           
		
	);
seg1: sevenseg_conditions PORT MAP(
	       hex =>in1,
           dot =>dot(1),
           en => en(1),
           seg =>s1
           
		
	);
seg2: sevenseg_conditions PORT MAP(
	       hex =>in2,
           dot =>dot(2),
           en => en(2),
           seg =>s2
           
		
	);
seg3: sevenseg_conditions PORT MAP(
	       hex =>in3,
           dot =>dot(3),
           en => en(3),
           seg =>s3
          
		
	);



with s_clk(16 downto 15) select
    seg <= s0 when "00",
          s1 when "01",
          s2 when "10",
          s3 when others;
          
 


end Behavioral;

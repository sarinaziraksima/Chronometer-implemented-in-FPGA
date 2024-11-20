----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2024 12:42:55 PM
-- Design Name: 
-- Module Name: tim_test - Behavioral
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

entity tim_test is
Port ( 
            go : in STD_LOGIC;
            clr : in STD_LOGIC; 
            sel : in STD_LOGIC; 
            clk : IN std_logic;
            dot : IN std_logic_vector(3 downto 0);
            led_go1 : out std_logic;
            led_go2 : out std_logic;
            en : OUT std_logic_vector(3 downto 0);                     
            seg : OUT std_logic_vector(7 downto 0));
            
            
end tim_test;

architecture Behavioral of tim_test is



signal d0_s, d1_s, d2_s, d3_s, d4_s: std_logic_vector(3 downto 0); 
signal in0_s, in1_s, in2_s, in3_s: std_logic_vector(3 downto 0); 
signal dot_s: std_logic_vector(3 downto 0); 
signal go_s, clr_s, sel_s: std_logic;--output of the condition
signal go_si, clr_si, sel_si: std_logic;--input of the switch
signal go_so, clr_so, sel_so: std_logic;--output of the switch


COMPONENT switch_noise
	Port ( i_s : in STD_LOGIC;
           clk : in STD_LOGIC;
           o_s : out STD_LOGIC);
END COMPONENT;
COMPONENT tim
	Port ( clk : in STD_LOGIC;
           go : in STD_LOGIC;
           clr : in STD_LOGIC;
           d4 : out STD_LOGIC_VECTOR (3 downto 0);
           d3 : out STD_LOGIC_VECTOR (3 downto 0);
           d2 : out STD_LOGIC_VECTOR (3 downto 0);
           d1 : out STD_LOGIC_VECTOR (3 downto 0);
           d0 : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT test_4segs
	Port ( in0 : IN std_logic_vector(3 downto 0);
	    in1 : IN std_logic_vector(3 downto 0);
	    in2 : IN std_logic_vector(3 downto 0);
	    in3 : IN std_logic_vector(3 downto 0);	    
		clk : IN std_logic;
		dot : IN std_logic_vector(3 downto 0);
		en : OUT std_logic_vector(3 downto 0);          
		seg : OUT std_logic_vector(7 downto 0));
END COMPONENT;



begin





      

timer_c: tim PORT MAP ( 
       clk => clk,
       go => go_s,
       clr => clr_s,
       d4 => d4_s,
       d3 => d3_s,
       d2 => d2_s,
       d1 => d1_s,
       d0 => d0_s);
		
		
seg_c: test_4segs PORT MAP ( 
        in0 => in0_s,
	    in1 => in1_s,
	    in2 => in2_s,
	    in3 => in3_s,
		clk => clk,
		dot => dot_s,
		en => en,
		seg => seg);
		



process(clk)
begin
    
    
    if(rising_edge(clk)) then 
        
        if go='0' then 
            go_s <= not go_s;
        end if;
        if clr='0' then 
            clr_s <= not clr_s;
        end if;
        if sel='0' then 
            sel_s <= not sel_s;
        
        end if;
        
        
        
    end if;
end process;




led_go1 <= go_s;
led_go2 <= clr_s;





in0_s <= d0_s when sel_s='1' else d1_s;
in1_s <= d1_s when sel_s='1' else d2_s;
in2_s <= d2_s when sel_s='1' else d3_s;
in3_s <= d3_s when sel_s='1' else d4_s;


dot_s <= "1101" when sel_s='1' else "1111";



        
end Behavioral;

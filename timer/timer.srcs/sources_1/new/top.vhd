----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2024 10:28:00 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
  Port (    
		clk : IN std_logic;
		dot : IN std_logic_vector(3 downto 0);
		en : OUT std_logic_vector(3 downto 0);          
		seg : OUT std_logic_vector(7 downto 0)
		);

end top;



architecture Behavioral of top is
COMPONENT test_4segs
	Port ( in0 : IN std_logic_vector(3 downto 0);
	    in1 : IN std_logic_vector(3 downto 0);
	    in2 : IN std_logic_vector(3 downto 0);
	    in3 : IN std_logic_vector(3 downto 0);	    
		clk : IN std_logic;
		dot : IN std_logic_vector(3 downto 0);
		en : OUT std_logic_vector(3 downto 0);          
		seg : OUT std_logic_vector(7 downto 0)
           );
END COMPONENT;
begin

 inputss: test_4segs PORT MAP ( 
        in0 =>"0001",
	    in1 =>"0011",
	    in2 =>"0100",
	    in3 =>"1000",
		clk =>clk,
		dot =>"0101",
		en =>en,
		seg =>seg);


end Behavioral;

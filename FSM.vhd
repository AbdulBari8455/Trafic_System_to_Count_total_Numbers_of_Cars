----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:05:18 11/07/2021 
-- Design Name: 
-- Module Name:    code - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity code is
    Port ( 
	        a : in  STD_LOGIC;
           b : in  STD_LOGIC;
	        Enter : out  STD_LOGIC;
           Exi_t : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Total_cars : out  STD_LOGIC_VECTOR (3 downto 0));
end code;

architecture Behavioral of code is

signal count : STD_LOGIC_VECTOR (3 downto 0) := "0000";

signal E :STD_LOGIC :='0';
signal Ex:STD_LOGIC :='0';
begin

Count1:entity work.Bi_directional_counter port map (a,b,clk,count,reset);

process (a,b,clk)
 begin
 
 if (rising_edge(clk)) then
     if(a='0' and b='0') then
	   E<='0';
		Ex<='0';
     elsif(a='1' and b='0') then
	   E<='1';
		Ex<='0';
	  elsif(a='0' and b='1') then
	   E<='0';
		Ex<='1';
	  elsif(a='0' and b='0') then
  	   E<='1';
		Ex<='1';
	  end if;
 end if;

end process;

Enter<=E;
Exi_t<=Ex;
Total_cars <= count;

end Behavioral;

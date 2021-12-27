----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:40 11/07/2021 
-- Design Name: 
-- Module Name:    Bi_directional_counter - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bi_directional_counter is
    Port ( Enter  : in  STD_LOGIC;
           Exi_t : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           bi_counter : out  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC);
end Bi_directional_counter;

architecture Behavioral of Bi_directional_counter is

signal count : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

process (clk)
    begin
	 if (reset='1') then
        count <= "0000";
    elsif (rising_edge(clk)) then
	      if (Enter = '1' and Exi_t = '0' ) then
             count <= std_logic_vector( unsigned(count)+1 );   -- counting up
			end if;
			
         if (Exi_t = '1' and Enter = '0' ) then
              count <= std_logic_vector( unsigned(count) - 1 );   -- counting down
         end if;
			
     end if;
    end process;

bi_counter<= count;

end Behavioral;


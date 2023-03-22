library ieee;
use ieee.std_logic_1164.all;

entity seg7 is 
port(bcd : In std_logic_vector(3 downto 0) ;
		leds : Out std_logic_vector(0 to 6) ) ; 
end seg7 ; 


architecture behaviour of seg7 is 
begin 
	process (bcd) 
	begin 
		case bcd is 
			when "0000" => leds <= "0000001" ; 
			when "0001" => leds <= "1001111" ;
			when "0010" => leds <= "0010010" ;
			when "0011" => leds <= "0000110" ;
			when "0100" => leds <= "1001100" ;
			when "0101" => leds <= "0100100" ;
			when "0110" => leds <= "0100000" ;
			when "0111" => leds <= "0001111" ;
			when "1000" => leds <= "0000000" ;
			when "1001" => leds <= "0000100" ;
			when others => leds <= "-------" ;
		end case ; 
	end process ;
end behaviour ;

library ieee;
use ieee.std_logic_1164.all;

package seg7_package is 
	component seg7 
	 port(bcd : In std_logic_vector(3 downto 0) ;
		leds : Out std_logic_vector(0 to 6) ) ; 
	 end component ; 
end seg7_package ; 
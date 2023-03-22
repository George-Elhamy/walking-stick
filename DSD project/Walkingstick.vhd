library ieee;
use ieee.std_logic_1164.all;

entity stick is
port (IR , T , switch , arduino: in std_logic ;
		B , V : out std_logic );
end stick ;

architecture arch of stick is 
begin 
		V <= ((not arduino) or (not IR)) AND switch ; 
		B <= not T and switch ;
end arch ;  
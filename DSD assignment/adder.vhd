library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.seg7_package.all;

entity adder is 
port (X,Y : in std_logic_vector(3 downto 0) ;
		S :  out std_logic_vector(4 downto 0) ; 
		led1 , led0 : out std_logic_vector(0 to 6) ); 
end adder ;


architecture arch of adder is 
signal Sum: std_logic_vector(4 downto 0);
Signal x0 , x1 , y0 , y1: std_logic_vector (3 downto 0) ;
signal r1 : std_logic_vector(3 downto 0);
signal carry : std_logic ;
signal xd , yd , r0: std_logic_vector(4 downto 0);
		 
begin 
	Sum <= ('0'&X)+Y;
	S <= Sum ;
	xd <= ('0'&x)+6;
	x0 <= x when x<=9 else xd(3 downto 0);
	x1 <= "0000" when x<=9 else "000"&xd(4);
	
	yd <= ('0'&y)+6;
	y0 <= y when y<=9 else yd(3 downto 0);
	y1 <= "0000" when y<=9 else "000"&yd(4);
	
	r0 <= ('0'&x0+y0) when ('0'&x0+y0)<=9 else ('0'&x0+y0)+6 ;
	carry <= '0' when r0<=9 else '1';
	r1 <= x1+y1+carry;
	
	stage0: seg7 port map(r0(3 downto 0),led0);
	stage1: seg7 port map(r1,led1);

end arch ;	
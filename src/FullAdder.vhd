library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity FullAdder is
	Port(A_i : in std_logic;
		  B_i : in std_logic;
		  C_i : in std_logic;
		  S_o : out std_logic;
		  C_o : out std_logic);
end FullAdder;
	
architecture behavorial of FullAdder is
signal s1,s2,s3: std_logic;

begin

s1 <= A_i xor B_i;
S_o <= s1 xor C_i;
s2 <= C_i and s1;
s3 <= A_i and B_i;
C_o <= s2 or s3;

end behavorial;

	
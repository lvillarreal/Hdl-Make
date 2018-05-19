LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RippleCarryAdder is
	generic(
		DATA_WIDTH: integer := 8
	);
	
	port(	
		A_in, B_in: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		C_in: in std_logic;
		S_out: out std_logic_vector(DATA_WIDTH -1 downto 0);
		C_out: out std_logic);
end RippleCarryAdder;

architecture Behavioral of RippleCarryAdder is

-- Instanciacion del componente FullAdder
component FullAdder Port( A_i, B_i, C_i : in std_logic;
								  S_o, C_o : out std_logic
								 );
end component;

-- Definicion de Señal interna (Carry) 

signal carry: std_logic_vector(DATA_WIDTH downto 0);

begin

	Carry(0) <= C_in;
	C_out <= Carry(DATA_WIDTH);
	
	sumGen: for i in 0 to DATA_WIDTH - 1 generate
	
		U_i : FullAdder port map (A_i => A_in(i),
										  B_i => B_in(i),
										  C_i => carry(i),
										  S_o => S_out(i),
									     C_o => carry(i+1)
										  );
	end generate;
end Behavioral;










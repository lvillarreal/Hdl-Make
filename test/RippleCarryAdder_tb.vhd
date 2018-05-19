LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RippleCarryAdder_tb is
end RippleCarryAdder_tb;

architecture Behavioral of RippleCarryAdder_tb is
-- Component Declaration for the Unit Under Test (UUT)
	component RippleCarryAdder
		generic(
			DATA_WIDTH: integer := 8
		);
		port(	A_in, B_in: in std_logic_vector(DATA_WIDTH - 1 downto 0);
				C_in: in std_logic;
				S_out: out std_logic_vector(DATA_WIDTH -1 downto 0);
				C_out: out std_logic);
	end component;

	constant size: integer := 8;
	-- signals definition
	signal A_in, B_in: std_logic_vector(size - 1 downto 0);
	signal C_in: std_logic;
	signal S_out: std_logic_vector(size -1 downto 0);
	signal C_out: std_logic;
	signal suma: std_logic_vector(size downto 0);
	-- signal errors: boolean <= false;
	-- Instantiation
begin
	uut: RippleCarryAdder port map(	
				A_in => A_in, 
				B_in => B_in,
				C_in => C_in,
				S_out => S_out,
				C_out => C_out);
				
	-- stimulus process
	
	stim_proc: process
	
	-- variable suma: std_logic_vector(size downto 0);
	variable errors: boolean := false;
	
	begin
	
		for c in 0 to 1 loop
			
			if c = 0 then 
				C_in <= '0';
			else 
				C_in <= '1';
			end if;
			
			for i in 0 to (2**size)-1 loop
				
				for k in 0 to (2**size)-1 loop
					
					A_in <= std_logic_vector(to_unsigned(i,size));
					B_in <= std_logic_vector(to_unsigned(k,size));
					suma <= std_logic_vector(to_unsigned(i+k+c,size+1));
					
					wait for 5 ns;
					
					if C_out /= suma(size) then
						assert false
						report "Error en el Carry.";
						errors := true;
					end if;
					
					if suma(size-1 downto 0) /= S_out then
						assert false
						report "Error en la Suma.";
						errors := true;
					end if;				
					
				end loop;
			end loop;
		end loop;
		
		-- Reportar si hubo errores
		assert not errors
		report "Fallo el testeo"
		severity note;
		
		assert errors
		report "Paso el testeo"
		severity note;
		
		wait;
				
	end process;
end Behavioral;
	
	
	
	
	
	
	
	
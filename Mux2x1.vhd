entity  Mux2x1 is 
	port( IA,  IB 		: in bit; 
			S			 	: in bit;
			E				: in bit;
			Y1, Y2, Y3	: out bit
			
			);
end Mux2x1;
	
architecture Mux of Mux2x1 is

begin 
		Y1 <= (IA and not E and not S) or		--Variante1 undbdingte 	
				(IB and not E and S);
--------------------------------------------		
		with S select 
		Y2 <= (IA and not E) when '0',			--- Variante2 Selective
				(IB and not E) when '1';
---------------------------------------------				
				
		Y3 <= (IA and not E)when S='0' else 	---Variante3 when else(bedingte)
				(IB and not E);
				
end MUx;
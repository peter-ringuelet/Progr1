program prueba.pas;
var c:char; b500: boolean; pal:integer;
begin
 pal:=0; b500:=False;
 
	write('Escriba una letra: ');
	readln(c);
	
	while(c=' ') do 
	begin
		write('Escriba una letra: ');
		readln(c);
	end;

	pal:=0; b500:=False; 
	while (c<>'z') and (not b500) do
	begin
		while ((c<>'z') and (not b500)) and (c<>' ') do 
		begin

			if (c='5') then 
			begin
				write('Escriba una letra: ');
				readln(c);
				if(c='0') then
				begin
					write('Escriba una letra: ');
					readln(c);
					if (c='0') then b500:=true;
				end;
			end;
			while(c=' ') do begin 
			write('Escriba una letra: ');
			readln(c);
			end;
			write('Escriba una letra: ');
			readln(c);

		end;
		pal:=pal+1;
	end;
	writeln('Palabras totales: ', pal);
end.
	
			
			
	
	

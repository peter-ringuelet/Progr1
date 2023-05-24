program p2ej7;
var 
	c: char; cantPalabras: integer; max: integer; caracteres: integer; 
Begin
	cantPalabras:=0;
	max:= -1;
	write('Ingrese un caracter: ');
	readln(c);
	while (c = ' ') do
	begin
		write('Ingrese un caracter: ');
		readln(c);
	end;

	while (c <> '.') do 
	begin
		cantPalabras:= cantPalabras+1;
		if (c = 't') then 
		begin
		
			caracteres:=0;
			while (c <> '.') and (c <> ' ') do 
			begin 
				caracteres:= caracteres +1;
				write('Ingrese un caracter: ');
				readln(c);
			end;
			if (caracteres>max)then max:=caracteres;
		end;
		if (c <> 't') then
		begin 
			while (c <> '.') and (c <> ' ') do
			 begin 
				write('Ingrese un caracter: ');
				readln(c); 
			end;
		end;
		while (c = ' ') do 
		begin
		write('Ingrese un caracter: ');
		readln(c);
		end;
				
	end;
	writeln('Longitud de la palaba mas larga que empieza con t: ', max);
	writeln('Palabras totales: ', cantPalabras);
	
	
		
	
		
End.		

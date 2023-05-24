Program Ej10a;
const fin = '#';
var long: integer; c: char; cantP: integer;
Begin
	cantP:=0;
	write('Escriba un caracter: ');
	readln(c);
	while (c = ' ') do			{DESCARTO BLANCOS} 
	begin
		write('Escriba un caracter: ');
		readln(c);
	end;
	while (c <> '#') do 
	begin
		long:=0;
		while (c <> ' ') and (c <> '#') do 
		begin
			long:= long + 1;
			write('Escriba un caracter: ');
			readln(c);
		end;
		if (c = ' ') then  
		begin
			write('Escruba un caracter: ');
			readln(c);
		end;
		if (long = 6 ) then cantP:=cantP + 1;

	end;
	writeln('La cantidad de palabras de longitud 6 que componen la secuencia son: ', cantP);




End.


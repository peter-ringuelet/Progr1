program P3Ej9;
const FIN = '.';

function PSeguidaDeA (c: char; VAR ant: char; VAR cantPalabras:integer ): integer;

begin

	if (ant = 'p') and (c = 'a') then cantPalabras:= cantPalabras + 1;
	ant:= c;
	PSeguidaDeA:= cantPalabras;
		
end;
var 	c: char; ant: char;	cantP: integer;

BEGIN

	cantP:=0;
	write('Escriba un caracter: ');
	readln(c);
	while (c = ' ') do
	begin 
		write('Escriba un caracter: ');
		readln(c);		{DESCARTO BLANCOS}
	end;		
	while (c <> FIN) do 
	begin
		while (c <> ' ') and (c <> FIN) do 
		begin
			cantP:= PSeguidaDeA(c,ant,cantP);
			write('Escriba un caracter: ');
			readln(c);
		end;
		while(c = ' ') do
		begin
			write('Escriba un caracter: ');
			readln(c);			{DESCARTO BLANCOS}
		end;
		
	end;
	writeln('Cantidad de veces que aparece la p seguida de la a: ', cantP);
	
END. 














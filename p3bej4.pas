program p3bej4;
type minusculas = set of char;
procedure resultado (letrasFinal: minusculas);
var i: char;
Begin
	for i:= 'a' to 'z' do
	begin
		if(i IN letrasFinal) then writeln(i, ' no fue usada.');
	end;
End;
procedure contabilizar (VAR letras: minusculas);
var secuencia: char;
Begin
	write('Ingrese un caracter: ');
	readln(secuencia);
	while(secuencia <> '#') do
	begin
		letras:= letras - [secuencia];
		write('Ingrese un caracter: ');
		readln(secuencia);
	end;
	resultado(letras);
End;
var conjunto: minusculas;
Begin
	conjunto:=['a'..'z'];
	contabilizar(conjunto);
End.

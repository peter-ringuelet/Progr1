program p7bej6;
const	dimfE=3;

type
	cadena30=string[30];
	estrella = RECORD
		nombre:cadena30;
		superficie:integer;

		end;
	
	estrellas = array[1..dimfE] of estrella;

procedure leer(var e:estrellas);
var i: integer;
begin
	for i:=1 to dimfE do 
	begin
		write('Nombre: ');
		readln(e[i].nombre);
		write('Superficie: ');
		readln(e[i].superficie);
	end;
end;

procedure imprimir (e:estrellas);
var i: integer;
begin
	for i:=1 to dimfE do
	begin
		writeln(e[i].nombre);
		writeln(e[i].superficie);
	end;
end;


var e:estrellas;

begin
	leer(e);
	imprimir(e);
end.
		
		
		
			

program prueba;
type
 re= RECORD
				campo1: integer;
				campo2: integer;
				campo3: integer;
			end;
procedure leer (VAR t: re);
begin
	with t do 
	begin
		readln(campo1);
		readln(campo2);
		readln(campo3);
	end;
end;
var t: re;
begin
	leer(t);
		with t do 
	begin
		writeln(campo1);
		writeln(campo2);
		writeln(campo3);
	end;
end.

program p7ej8;
const dimf=10;
type
	cadena30= string[30];
	vector= array [1..dimf] of cadena30;
	
	procedure inicializarvectores (var v: vector);
	var i: integer;
	begin
		for i:=1 to dimf do
		begin
			v[i]:= '.';
		end;
	end;
	
	procedure cargarvectores (var v: vector; var diml: integer);
	var palabra: cadena30;
	begin
		diml:=0;
		readln(palabra); 
		while (palabra <> '.') and (diml < dimf)do 
		begin
			diml:=diml+1;
			v[diml]:= palabra;
			if (diml< dimf) then readln(palabra);
		end;
	end;
	
	procedure contpalabras (v: vector; var cant: integer; diml: integer);
	begin
		cant:=0;
		while (cant < diml) and (v[cant] <> '.') do 
		begin
			cant:= cant+1;
		end;
		writeln(cant);
	end;
	

var v: vector;	diml:integer;	cant: integer;
begin
	inicializarvectores(v);
	cargarvectores(v, diml);
	contpalabras(v,cant, diml);
end.
			
			

program p7ej11;
const dimf=7;
type 
	vector=array [1..dimf] of real;

procedure inicializar (var v:vector);
var i: integer;
begin
	for i:=1 to dimf do v[i]:=0;
end;

procedure cargar(var v:vector);
var r: real; i:integer; encontre: boolean; j:integer;
begin
	readln(r);
	while (r <> 50) do
	begin
		encontre:=false;
		i:=0;
		while(i < dimf) and (not encontre) do
		begin
			i:=i+1;
			if (r > v[i]) then 
			begin
				for j:=dimf downto i do v[j+1]:=v[j];
				encontre:=true;
				v[i]:=r;
			end;
		end;		
		readln(r);
	end;
end;

procedure imprimir (v: vector);
var i:integer;
begin
	for i:=1 to dimf do
	begin
		writeln(v[i]:2:2);
	end;
end;

var v: vector;

begin
	inicializar(v);
	cargar(v);
	imprimir(v);
end.

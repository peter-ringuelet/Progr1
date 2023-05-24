program pruebaParcial;
type puntero = ^integer;
var p: puntero; i: integer;
begin
	new(p);
	i:=2;
	p:=i;
	writeln(p^);
end.

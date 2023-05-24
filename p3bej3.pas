program p3bej3;
type 
	cantOfi=1..15;
	oficina = RECORD
				numero: cantOfi;
				metros: integer;
				habitaciones: integer;
				HorasxMes: integer;
				PrecioxHora: integer;
				end;
procedure LeerOficinas (VAR O: oficina);
Begin
	with o do
	begin
		write('Numero: ');
		readln(numero);
		write('Metros cuadrados: ');
		readln(metros);
		write('Habitaciones: ');
		readln(habitaciones);
		write('Horas por mes: ');
		readln(HorasxMes);
		write('Precio por hora: ');
		readln(PrecioxHora);
	end;
End;

procedure MontoRecaudado(o: oficina; VAR tot: integer);
Begin
	tot:=tot+o.PrecioxHora*o.HorasxMes;
End;

procedure MenosHorasAlquiladas (VAR o: oficina; VAR tot: integer);
var i, min, NumMin: integer;
Begin
	min:= 9999;
	for i:=1 to 15 do 
	begin
		LeerOficinas(o);	
		MontoRecaudado(o, tot);
		if (o.HorasxMes < min) then 
		begin
			min:= o.HorasxMes; NumMin:=o.numero;
		end;
	end;
	writeln(NumMin, ' es la oficina con menor horas alquiladas (', min, 'hs)' );
End;


var ofi: oficina; tot: integer;
Begin
	tot:= 0;
	MenosHorasAlquiladas(ofi, tot);
	writeln('Total recaudado: $', tot);
End.	
				

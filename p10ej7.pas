program p10ej7;
type
	cadena30 = string[30];
	juvilado = RECORD
		dni: integer;
		apellido: cadena30;
		nombre: cadena30;
		monto: integer;
	end;
	
	lista = ^nodo;
	nodo = RECORD
		datos: juvilado;
		sig: lista;
	end;
	
	vector = array [0..9] of lista;
	
	procedure AgregarFinal (var l:lista; j: juvilado);
	var nue, act: lista;
	begin
		new(nue);
		nue^.datos.dni:=j.dni;
		nue^.datos.apellido:=j.apellido;
		nue^.datos.nombre:=j.nombre;
		nue^.datos.monto:=j.monto;
		nue^.sig:=nil;
		if (l <> nil) then 
		begin
			act:=l;
			while (act^.sig <> nil) do act:=act^.sig;
			act^.sig:=nue;
		end
		else l:=nue;
	end;
	
	function ultimoDig (l: lista): integer;
	begin
		ultimoDig:= (l^.datos.dni mod 10);
	end;
	
	
	procedure nuevaslistas (var v: vector; l:lista);
	begin
		while (l <> nil) do
		begin
			case ultimoDig(l) of
			0: AgregarFinal(v[0], l^.datos);
			1: AgregarFinal(v[1], l^.datos);
			2: AgregarFinal(v[2], l^.datos);
			3: AgregarFinal(v[3], l^.datos);
			4: AgregarFinal(v[4], l^.datos);
			5: AgregarFinal(v[5], l^.datos);
			6: AgregarFinal(v[6], l^.datos);
			7: AgregarFinal(v[7], l^.datos);
			8: AgregarFinal(v[8], l^.datos);
			9: AgregarFinal(v[9], l^.datos);
			end;
			l:=l^.sig;
		end;
	end;
	
	procedure InicializarVector (var v: vector);
	var i:integer;
	begin
		for i:=0 to 9 do v[i]:=nil;
	end;
	
	procedure LeerJuvilado (var j:juvilado);
	begin
		write('DNI: ');
		readln(j.dni);
		if (j.dni <> 999) then
		begin
			write('Apellido: ');
			readln(j.apellido);
			write('Nombre:');
			readln(j.nombre);
			write('Monto: ');
			readln(j.monto);
		end;
	end;
	
	procedure imprimirVector (v: vector);
	var i: integer;
	begin
		for i:=0 to 9 do
		begin
			if (v[i] <> nil) then
			begin
				while (v[i] <> nil) do
				begin
					writeln(v[i]^.datos.nombre);
					v[i]:=v[i]^.sig;
				end;
			end
			else writeln('La lista ', i, ' esta vacia.');
		end;
	end;
		
		
	
	
var 
	l: lista; v: vector; j: juvilado;
		
Begin
	l:=nil;
	InicializarVector(v);
	LeerJuvilado(j);
	while (j.dni <> 999) do
	begin
		AgregarFinal(l,j);
		LeerJuvilado(j);
	end;
	
	nuevaslistas(v,l);
	imprimirVector(v);
	
End.
		
	
		
		
			
			

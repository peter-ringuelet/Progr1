program tarea;
type
	cadena30 = string[30];
	persona = RECORD
		nombre: cadena30;
		apellido: cadena30;
		edad: integer;
		dni: integer;
	end;
	
	lista = ^nodo;
	nodo = RECORD 
		datos: persona;
		sig: lista;
	end;
	
	procedure LeerPersona (var p: persona);
	Begin
		write('Nombre: ');
		readln(p.nombre);
		if (p.nombre <> 'fin') then 
		begin
			write('Apellido: ');
			readln(p.apellido);
			write('Edad: ');
			readln(p.edad);
			write('Dni: ');
			readln(p.dni);
		end;
	End;
	
	procedure AgregarOrdenado (var l: lista; p: persona);
	var ant, nue, act: lista;
	begin
		new(nue);
		nue^.datos.nombre:=p.nombre;
		nue^.datos.apellido:=p.apellido;
		nue^.datos.edad:=p.edad;
		nue^.datos.dni:=p.dni;
		act:=l;
		ant:=l;
		while (act <> nil) and (act^.datos.apellido < p.apellido) do
		begin
			ant:=act;
			act:=act^.sig;
		end;
		if (ant = act) then l:=nue
			else ant^.sig:=nue;
		nue^.sig:=act;
	end;
	
	procedure CargarDatos (var l: lista; var p: persona);
	Begin
		LeerPersona(p); 
		while (p.nombre <> 'fin') do
		begin
			AgregarOrdenado(l,p);
			LeerPersona(p);
		end;
	End;
	
	procedure Eliminar (var l:lista; edad: integer);
	var ant, act: lista;
	begin
		act:=l;
		while (act <> nil) do 
		begin
			while (act <> nil) and (act^.datos.edad < edad) do
			begin
				ant:=act;
				act:=act^.sig;
			end;
			if (act <> nil) then
			begin
				if (act = l) then l:=act^.sig
				else ant^.sig:=act^.sig;
			end;
			act:=act^.sig;
		end;
		dispose(act);
	end;
	
	{procedure EliminarTodasLasEdades (var l: lista; edad: integer);	//Al final no lo uso
	var	aux: lista;
	begin
		aux:=l;
		while (aux <> nil) do						
		begin
			Eliminar(aux,edad);
			aux:=aux^.sig;
		end;
	end;}
	
	
	procedure imprimir(l:lista);
	begin
		while (l <> nil) do
		begin
			writeln(l^.datos.nombre);
			writeln(l^.datos.apellido);
			writeln(l^.datos.edad);
			writeln(l^.datos.dni);
			l:=l^.sig;
		end;
	end;

	
var
	l:lista; edad: integer; p: persona;

Begin
	CargarDatos(l,p);
	imprimir(l);
	write('Edad a eliminar: ');
	readln(edad);
	{EliminarTodasLasEdades(l,edad);} // Al final no lo uso 
	Eliminar(l,edad);
	imprimir(l);
End.

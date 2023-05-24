program p11ej4;
type
	cadena10 = string [10];
	
	paquete = RECORD
		fecha: integer;
		entregado: boolean;
	end;
	
	lista = ^nodo;
	nodo = RECORD
		datos: paquete;
		sig: lista;
	end;
	
	procedure LeerPaquete (var p:paquete);
	var nom: cadena10;
	begin
		write('Fecha: ');
		readln(p.fecha);
		if (p.fecha <> 999) then
		begin
			write('Entrego? ');
			readln(nom);
			if (nom = 'si') then p.entregado:=true
							else p.entregado:=false;
		end;
	end;
	
	procedure CargarLista (var l: lista; p: paquete);
	var nue, act, ant: lista;
	begin
		new(nue);
		nue^.datos:=p;
		ant:=l;
		act:=l;
		while (act <> nil) and (act^.datos.fecha < p.fecha) do
		begin
			ant:=act;
			act:=act^.sig;
		end;
		
		if (act = ant) then l:=nue
						else ant^.sig:=nue;
		nue^.sig:=act;
	end;
	
	procedure imprimirLista (l: lista);
	begin
		while(l<>nil) do
		begin
			writeln(l^.datos.fecha);
			writeln(l^.datos.entregado);
			l:=l^.sig;
		end;
	end;
	
	procedure Eliminar (var ant,act: lista);
	begin
		if (ant = act) then ant:=act^.sig
						else ant^.sig:=act^.sig;
		dispose(act);
		act:=ant^.sig;
	end;
	
	procedure liberarMemoria (var l: lista);
	var aux: lista;
	begin
		while (l<>nil) do
		begin
			aux:=l;
			l:=l^.sig;
			dispose(aux);
		end;
	end;
	
	
var l, ant, act: lista; p: paquete;

Begin
	l:=nil;
	LeerPaquete(p);
	while (p.fecha <> 999) do
	begin
		CargarLista(l,p);
		LeerPaquete(p);
	end;
	
	act:= l;
	ant:=l;
	while (act <> nil) do
	begin
		if (not act^.datos.entregado) then Eliminar(ant,act)
										else
										begin
											ant:=act;
											act:=act^.sig;
										end;
	end;
	
	imprimirLista(l);
	liberarMemoria(l);
	writeln('Imprimir 2: ');
	imprimirLista(l);
	imprimirLista(act);
End.
		
		

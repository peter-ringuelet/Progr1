program p10ej9;
type
	cadena30 = string[30];
	venta = RECORD
		nombre: cadena30;
		codigo: integer;
		categoria: integer;
		asiento: integer;
	end;
	
	lista = ^nodo;
	nodo = RECORD
		datos: venta;
		sig: lista;
	end;
	
	matriz = array[1..30, 1..4] of integer;
	
	
	listaRegistros = ^nodoregistros;
	nodoregistros = RECORD 
		codigo: integer;
		pasajes: integer;
		monto: integer;
		sig: listaRegistros;
	end;
	
	codVentas = RECORD
		codigo: integer;
		total: integer;
	end;
	
	registro = array [1..6] of codVentas;

	listaCodigos = ^nodoCodigos;
	nodoCodigos = RECORD
		codigo: integer;
		sig: listaCodigos;
	end;
	
	procedure GenerarListaRegistros (var l:listaRegistros; codigo: integer; pasajes: integer; monto: integer);
	var nue, act: listaRegistros;
	begin
		new(nue);
		nue^.codigo:=codigo;
		nue^.pasajes:=pasajes;
		nue^.monto:=monto;
		nue^.sig:=nil;
		if (l <> nil) then 
		begin
			act:=l;
			while (act^.sig <> nil) do act:=act^.sig;
			act^.sig:=nue;
		end
		else l:=nue;
	end;
	
	procedure GenerarListaCodigos (var l: listaCodigos; codigos: )

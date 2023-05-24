program p10ej3;
type 
	cadena30 = string[30];
	
	lugares = RECORD 
		nombre: cadena30;
		pais: cadena30;
	end;
	
	lista = ^nodo;
	
	nodo = RECORD
		datos: lugares;
		sig: lista;
	end;
	
	function longitud (l:lista): integer;
	var cont: integer;
	begin
		cont:=0;
		while(l <> nil) do
		begin
			l:=l^.sig;
			cont:=cont+1;
		end;
		longitud:=cont;
	end;
		
	function contarPais (l: lista; pais: cadena30): integer;
	var cont: integer;
	begin
		cont:=0;
		while (l <>	nil) do
		begin
			if (l^.datos.pais = pais) then cont:=cont+1;
			l:=l^.sig;
		end;
		contarPais:=cont;
	end;
	
	function pertenece (l: lista; pais: cadena30): boolean;
	var encontre: boolean;
	begin
		encontre:=false;
		while (l <>	nil) and (not encontre) do 
		begin
			if (l^.datos.pais = pais) then encontre:=true
			else l:=l^.sig;
		end;
		pertenece:=encontre;
	end;
	
	procedure agregarfinal (var pri: lista; nombre, pais: cadena30);
	var act, nue: lista;
	begin
		new(nue);
		nue^.datos.nombre:=nombre;
		nue^.datos.pais:=pais;
		nue^.sig:=nil;
		if (pri <>	nil) then 
		begin
			act:=pri;
			while (act^.sig <>	nil) do act:= act^.sig;
			act^.sig:=nue;
		end
		else pri:=nue;
	end;
		
	
	procedure generarLista (l: lista; var l2: lista; pais: cadena30);
	begin
		if pertenece (l,pais) then 
		begin
			l2:=nil;
			while (l <>	nil) do
			begin
				if (l^.datos.pais = pais) then agregarfinal(l2, l^.datos.nombre, l^.datos.pais);
				l:=l^.sig;
			end;
			writeln('Lista Generada.');
		end
		else writeln('No se pudo generar la lista');
		
	end;
	
	procedure imprimir (l:lista);
	begin
		while (l <>	nil) do
		begin
			writeln(l^.datos.pais);
			writeln(l^.datos.nombre);
			l:=l^.sig;
		end;
	end;
	
var 
	l, l2: lista;
	pais, nombre: cadena30;

begin
	l:=nil;
	write('Pais: ');
	readln(pais);
	write('Nombre: ');
	readln(nombre);
	while (pais <>	'fin') do
	begin
		agregarfinal(l, nombre, pais);
		write('Pais: ');
		readln(pais);
		if (pais <> 'fin') then
		begin
			write('Nombre: ');
			readln(nombre);
		end;
	end;
	writeln('Longitud de la lista: ', longitud(l));
	write('Pais a buscar: ');
	readln(pais);
	writeln('Veces que aparece: ', contarPais(l,pais));
	write('Pais del cual quiere generar lista con los nombre de los lugares turisticos: ');
	readln(pais);
	generarLista(l,l2,pais);
	write('Nuevo lugar para agregar: ');
	readln(nombre);
	agregarfinal(l2,nombre,pais);
	imprimir(l2);
	writeln('--------------Lista 1------------------');
	imprimir(l);
end.
			
			
			
			
			
			
			
			
			
			
			
			
			
		
	

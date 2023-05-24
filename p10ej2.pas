program p10ej2;
type
	lista = ^nodo;
	nodo = RECORD 
		dato: integer;
		sig: lista;
	end;
	
	procedure leer (var pri: lista; num: integer);
	var act, nue: lista;
	begin
		new(nue);
		nue^.dato:= num;
		nue^.sig:= nil;
		if (pri <>	nil) then 
		begin
			act:=pri;
			while(act^.sig <> nil) do act:=act^.sig;
			act^.sig:=nue;
		end
		else pri:=nue;
	end;
	
	procedure mayorNumero (l: lista);
	var max: integer;
	begin
		max:=0;
		while (l<>nil) do
		begin
			if (l^.dato > max) then max:=l^.dato;
			l:=l^.sig;
		end;
		writeln('El mayor numero es ', max);
	end; 
	
	procedure cantidadimpar (l: lista; var cant: integer);
	var digitos: integer;	num:integer;
	begin
		cant:=0;
		while(l <> nil) do
		begin
			digitos:=0;
			num:= l^.dato;
			while (num <> 0) do
			begin
				num:= num div 10;
				digitos:=digitos+1;
			end;
			if ((digitos mod 2) = 1) then cant:= cant +1;
			l:=l^.sig;
		end;
		writeln('Cantidad de numeros con digitos impares: ', cant);
	end;
	
	procedure imprimir (l:lista);
	begin
		while (l <> nil) do 
		begin
			writeln(l^.dato);
			l:=l^.sig;
		end;
	end;
	
		
var 
	num: integer; l:lista; cant:integer;
	
Begin
	l:=nil;
	readln(num);
	while (num <> 0) do
	begin
		leer(l,num);
		readln(num);
	end;
	
	mayorNumero(l);
	cantidadimpar(l,cant);
	imprimir(l); 
End.

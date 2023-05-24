program p10ej6;
type
	tickets = RECORD
		caja: integer;
		nroTickets: integer;
		monto: integer;
	end;
	
	lista = ^nodo;
	nodo = RECORD 
		datos: tickets;
		sig: lista;
	end;
	
	caja = RECORD
		montoTot: integer;
		ticketsTot: integer;
	end;
		
	conj = set of 1..6;
	
	cajas = array [1..6] of caja;

	procedure cargarlista (var pri: lista; ticket: tickets);
	var nue, act: lista;
	begin
		new(nue);
		nue^.datos:= ticket;
		nue^.sig:=nil;
		if (pri <> nil) then
			begin
				act:=pri;
				while (act^.sig <> nil) do act:= act^.sig;
				act^.sig:=nue;
			end
			else pri:=nue;
	end;
	
	procedure NuevaLista100 (l: lista; var l2: lista);
	begin
		l2:=nil;
		while(l <> nil) do
			begin
				if(l^.datos.monto < 1000) then cargarlista(l2, l^.datos);
				l:= l^.sig;
			end;
	end;
	
	procedure InicializarCajas(var c:cajas);
	var i: integer;
	begin
		for i:=1 to 6 do
		begin
			c[i].montoTot:=0;
			c[i].ticketsTot:=0;
		end;
	end;
				
			
	
	procedure cargarCajas (var c: cajas; l: lista);
	begin
		while (l <> nil) do
		begin
			c[l^.datos.caja].montoTot:= c[l^.datos.caja].montoTot+ l^.datos.monto;
			c[l^.datos.caja].ticketsTot:= c[l^.datos.caja].ticketsTot+1;
			l:=l^.sig;
		end;
	end;
	
	function montoPromedio (c: cajas; i: integer): integer;
	begin
		montopromedio:= (c[i].montoTot div c[i].ticketsTot);
	end;
	
	procedure montoPromedioTodasLasCajas (c:cajas);
	var i: integer;
	begin
		for i:=1 to 6 do 
		begin
			if (c[i].ticketsTot <> 0) then writeln('Monto promedio de la caja ', i, ': ', montoPromedio(c,i))
										else writeln('La caja ', i, ' no cobro ningun ticket.');
		end;
	end;
	
	
	procedure listac (var l3: lista; l: lista; c: cajas);
	var conjunto: conj; i:integer;
	begin
		conjunto:= [];
		for i:=1 to 6 do
		begin
			if (c[i].montoTot > 12000) and (c[i].ticketsTot < 100) then conjunto:=conjunto + [i];
		end;
		l3:=nil;
		while (l <> nil) do
		begin
			if (l^.datos.caja in conjunto) then cargarlista(l3, l^.datos);
			l:=l^.sig;
		end;
	end;
			
		 
	procedure imprimirLista (l: lista);
	begin
		while (l <> nil) do
		begin
			writeln(l^.datos.caja);
			writeln(l^.datos.nroTickets);
			writeln(l^.datos.monto);
			l:=l^.sig;
		end;
	end;
	
	
var
	l, l2, l3: lista; 
	c: cajas;
	ticket: tickets;

Begin
	l:=nil;
	write('Caja: ');
	readln(ticket.caja);
	if (ticket.caja <> 999) then
	begin
		write('Numero de ticket: ');
		readln(ticket.nroTickets);
		write('Monto: ');
		readln(ticket.monto);
	end;

	while (ticket.caja <> 999) do
	begin
		cargarlista(l, ticket);
		write('Caja: ');
		readln(ticket.caja);
		if (ticket.caja <> 999) then
		begin
			write('Numero de ticket: ');
			readln(ticket.nroTickets);
			write('Monto: ');
			readln(ticket.monto);
		end;
	end;
	
	NuevaLista100(l, l2);
	imprimirLista(l2);
	InicializarCajas(c);
	cargarCajas(c,l);
	montoPromedioTodasLasCajas(c);
	listac(l3,l,c);
	imprimirLista(l3);
	
End.
		
		
	
		
		
		 
		 
		 
		 
		 
		 
		 
		 
	
	
	

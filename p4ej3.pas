Program p4ej3;
uses Crt;
type 
	cadena30=string[30];
	paises = RECORD
			pais:cadena30;
			estado:cadena30;
			ciudad:cadena30;
			dinero:integer;
			habitantes:integer;
		end;
	
	procedure LEER (VAR p: paises);
	Begin
		with p do
		begin
			write('Nombre del pais: ');
			readln(pais);
			if (pais <> 'zzz') then 
			begin
				write('Nombre del estado: ');
				readln(estado);
				write('Nombre de la ciudad: ');
				readln(ciudad);
				write('Dinero recaudado: ');
				readln(dinero);
				write('Cantidad de habitantes por ciudad: ');
				readln(habitantes);
			end;
		end;
	End;
	
	procedure ProcesarPaises (VAR p: paises);
	var 
		antP, antE, antC: cadena30;	habP, habE, habC: integer;	montoP, montoE, montoC: integer; 
	Begin
		LEER (p);
		ClrScr;
		while (p.pais <> 'zzz') do 
		begin
			antP:=p.pais; habP:=0; montoP:=0;
			while (p.pais <> 'zzz') and (antP = p.pais) do
			begin
				antE:=p.estado; habE:=0; montoE:=0;
				while (p.pais <> 'zzz') and (antP = p.pais) and (antE = p.estado) do
				begin
					antC:= p.ciudad; habC:=0; montoC:=0;
					while (p.pais <> 'zzz') and (antP = p.pais) and (antE = p.estado) and (antC = p.ciudad) do 
					begin
						habC:= p.habitantes;
						montoC:= p.dinero;
						habE:= habE + habC;
						montoE:= montoE + montoC;
						habP:= habP + habC;
						montoP:= montoP + montoC;
						LEER(p); 
						ClrScr;
					end;
					writeln('Ingreso por habitante de la ciudad ', antC, ': ', montoC div habC);
				end;
				writeln ('Ingreso por habitante del estado ', antE, ': ', montoE div habE);
			end;
			writeln ('Ingreso por habitante del pais ', antP, ': ', montoP div habP);
		end;
				
		
	End;

var
	p:paises;
Begin 
	ProcesarPaises(p);
End.
	
	


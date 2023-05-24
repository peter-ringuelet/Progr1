program p7ej10;
const dimf= 10;
type
	cadena30 = string[30];
	vectorNombres= array[1..dimf] of cadena30;
	
procedure inicializar (var v: vectorNombres);
var i: integer;
begin
	for i:=1 to dimf do v[i]:='vacio';
end;
	
procedure leer(var v:vectorNombres; var diml: integer);
var nombre: cadena30;
begin
	diml:=0;
	readln(nombre);
	while(diml < dimf) and (nombre <> 'fin') do
	begin
		diml:=diml+1;
		v[diml]:=nombre;
		if (diml < dimf) then readln(nombre);
	end;
end;

procedure imprimir(v: vectorNombres; diml: integer);
var respuesta: cadena30; i: integer;
begin
	write('Quiere que le imprima el vector? ');
	readln(respuesta);
	if (respuesta = 'si') then 
	begin
		i:=0;
		while (i < diml) do 
		begin
			i:=i+1;
			write(v[i]);
		end;
	end;
end;

procedure buscar (v: vectorNombres; diml: integer; var pos: integer; nom: cadena30);
var encontre: boolean;
begin
	encontre:=false;
	pos:=0;
	while (pos < diml) and (not encontre) do
	begin
		pos:=pos+1;
		if (v[pos] = nom) then encontre:=true;
	end;
	if (encontre) then write('El nombre ', nom, ' se encontraba en la posicion ', pos)
	else write ('El nombre no esta en el vector');
end;



procedure insertar(var v: vectorNombres; var diml: integer; nom:cadena30);
var exito: boolean; pos:integer; i: integer;
begin
	if (diml < dimf) then
	begin
		exito:=false;
		pos:=0;
		while (pos < diml) and (not exito) do
		begin
			pos:=pos+1;
			if (v[pos] < nom) then exito:=true;
		end;
		if (pos=diml) and (v[pos] > nom) then
		begin
			diml:=diml+1;
			v[diml]:=nom;
		end;
		if (exito) then 
		begin
			for i:=diml downto pos do v[i+1]:=v[i];
			v[pos]:=nom;
			diml:=diml+1;
		end;
	end;
end;
			
					
				
procedure eliminar (var v:vectorNombres; var diml:integer; nom: cadena30);
var existe: boolean; pos: integer; i: integer;
begin
	pos:=0;
	existe:=false;
	while (pos < diml)  do
	begin
		pos:=pos+1;
		if (v[pos] = nom) then existe:=true;
		if (existe) then 
		begin
			while (v[pos]= nom) do
			begin
				for i:=pos to diml do v[i]:=v[i+1];
				diml:=diml-1;
			end;
		end;
	end;
	
end;
		
	

var v: vectorNombres; diml: integer; nom: cadena30; pos:integer;

begin
	inicializar(v);
	leer(v, diml);
	imprimir(v,diml);
	write('Nombre a buscar: ');
	readln(nom);
	buscar(v, diml, pos, nom);
	write('Nombre a insertar: ');
	readln(nom);
	insertar(v, diml, nom);
	imprimir(v,diml);
	write('Nombre a eliminar: ');
	readln(nom);
	eliminar(v,diml,nom);
	imprimir(v,diml)
end.



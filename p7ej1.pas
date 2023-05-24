program p7ej1;
uses crt;
const dimF = 10;
type 
vectNumeros = array [1..dimF] of integer;

procedure Leer(var v: vectNumeros);
var	i: integer;
begin
	for i:= 1 to dimF do 
	begin
		write('Escriba un numero: ');
		readln(v[i]);
	end;
	readkey();
	clrscr;
	
end;

procedure Imprimir (var v: vectNumeros);
var i: integer;
begin
	for i:= 1 to dimF do
	begin
		writeln (v[i]);
	end;
	readkey();
	clrscr;
	
end;

procedure promedioYporcentaje (v: vectNumeros);
var	i: integer;	prom: integer;	tot: integer; numNegativos, numPositivos, porcentajePositivos, porcentajeNegativos: integer;
begin
	tot:=0;	numNegativos:=0; numPositivos:=0;
	for i:=1 to dimF do
	begin
		tot:= tot + v[i];
		if (v[i] < 0) then numNegativos:= numNegativos + 1;
		if (v[i] >= 0) then numPositivos:= numPositivos + 1;
	end;
	prom:= tot div dimF;
	porcentajePositivos:= (numPositivos * 100) div dimF;
	porcentajeNegativos:= (numNegativos * 100) div dimF;
	writeln('El porcentaje de numeros negativos es: %', porcentajeNegativos);
	writeln('El porcentaje de numeros positivos es de: %', porcentajePositivos);
	writeln('El promedio es de: ', prom);
	readkey();
	clrscr;
	
end;

procedure ElementosRango (v: vectNumeros; num1, num2: integer);
var	i: integer;	elementos: integer;
begin
	elementos:=0;
	for i:=num1 to num2 do
	begin
		writeln(v[i]);
		elementos:= elementos + 1;
	end;
	writeln('Elementos dentro del rango: ', elementos);
end;

procedure LeerValoresRango(var num1, num2: integer);
begin
	write('Escriba un numero desde el que quiere comenzar a leer el vector: ');
	readln(num1);
	write('Escriba un numero hasta el que quiera dejar de leer el vector: ');
	readln(num2);
	readkey();
	clrscr;
	
end;

procedure DosValoresMaximos(v: vectNumeros; var pos1, pos2, max1, max2: integer);
var i: integer;
begin
	max1:=0;
	max2:=0;
	for i:=1 to dimF do
	begin
		if (v[i] > max1) then
		begin
			max2:=max1;
			pos2:=pos1;
			max1:=v[i]; 
			pos1:= i;
		end
		else if (v[i] > max2) then 
		begin
			max2:= v[i];
			pos2:=i;
		end;
	end;
	writeln('El valor maximo es ', max1, ' y se encuentra en la posicion ', pos1);
	writeln('El segundo valor maximo es ', max2, ' y se encuentra en la posicion ', pos2);
	readkey();
	clrscr;
	
end;

var	v: vectNumeros; num1, num2: integer;	pos1, pos2, max1, max2: integer;

Begin
	Leer(v);
	Imprimir(v);
	promedioYporcentaje(v);
	LeerValoresRango(num1,num2);
	ElementosRango(v,num1,num2);
	DosValoresMaximos(v, pos1, pos2, max1, max2);
	
End. 


 b Program p5ej4;
uses crt;
type
	cadena30=string[30];
	videojuego = RECORD
				nombre: cadena30;
				categoria: cadena30;
				idioma: cadena30;
				votos: integer;
				end;
procedure Leer (VAR v: videojuego);
Begin
	with v do
	begin
		write('Categoria: ');
		readln(categoria);
		if (categoria <> 'fin') then 
		begin
			write('Idioma: ');
			readln(idioma);
			write('Nombre: ');
			readln(nombre);
			write('Votos: ');
			readln(votos);
			clrscr;
		end;
	end;
End;

procedure MasJuegosYVotos (VAR v: videojuego);																											{a}
var	actCat: cadena30;	cantJuegos, cantVotos: integer;		CatConMasJuegos, CatConMasVotos: cadena30; 	maxVotos, maxJuegos: integer;
Begin
	maxVotos:=0; maxJuegos:=0;
	Leer(v);
	while (v.categoria <> 'fin') do 
	begin
		actCat:= v.categoria; cantJuegos:=0; cantVotos:=0;
		while (v.categoria = actCat) do 
		begin
			cantJuegos:= cantJuegos + 1;
			cantVotos:= cantVotos + v.votos;
			Leer(v);
		end;
		if (cantJuegos > maxJuegos) then 
		begin
			maxJuegos:= cantJuegos;
			CatConMasJuegos:= actCat;
		end;
		if (cantVotos > maxVotos) then 
		begin
			maxVotos:=cantVotos;
			CatConMasVotos:= actCat;
		end;
	end;
	writeln('La categoria con mas votos es ',CatConMasVotos, ' con ', maxVotos, ' votos.' );
	writeln('La categoria con mas juegos es ', CatConMasJuegos, ' con ', maxJuegos, ' juegos.');
End;

procedure PromedioVotosEducativosPorIdioma (Var v: videojuego);																							{b}
var	prom: integer;	votosTot, juegosTot: integer; actCat, actIdioma: cadena30;
Begin
	Leer(v);
	while (v.categoria <> 'fin') do 
	begin
		while (v.categoria <> 'educativo') do Leer(v);
		actCat:= v.categoria;
		while(v.categoria <> 'fin') and (v.categoria = actCat) do 
		begin
			votosTot:=0;	juegosTot:=0;	actIdioma:=v.idioma;
			while (v.categoria <> 'fin') and (v.categoria = actCat) and (v.idioma = actIdioma) do
			begin
				if (v.categoria = 'educativo' ) then
				begin
				votosTot:=votosTot + v.votos;
				juegosTot:=juegosTot + 1;
				end;
				Leer(v);
				
			end;
			if (actCat = 'educativo') then begin
			prom:= votosTot div juegosTot;
			writeln('Promedio de votos recibidos para los juegos educativos en ', actIdioma, ': ', prom );
			end;
		end;
	end;
End;

procedure NombreIdiomaJuegoMasVotado (var v: videojuego);																								{c}
var maxVotosJuego, maxVotosIdioma: integer;		nombreMasVotado, idiomaMasVotado: cadena30;		actIdioma: cadena30;	votosIdioma: integer;
Begin
	maxVotosJuego:=-1;
	Leer(v);
	while(v.categoria <> 'fin') do
	begin
		actIdioma:= v.idioma;
		maxVotosIdioma:=-1;
		votosIdioma:=0;
		while(v.idioma = actIdioma) and (v.categoria <> 'fin') do
		begin
			votosIdioma:= votosIdioma + v.votos; 
			if (v.votos > maxVotosJuego) then 
			begin
				nombreMasVotado:= v.nombre;
				maxVotosJuego:= v.votos;
				
			end;
			Leer(v);
		end;
		if (votosIdioma > MaxVotosIdioma) then
		begin
			maxVotosIdioma:= votosIdioma;
			idiomaMasVotado:= actIdioma;
		end;
	end;
	writeln('El idioma mas votado es el ', idiomaMasVotado, ' con ', maxVotosIdioma, ' votos totales.');
	writeln('El videojuego mas votado es el ', nombreMasVotado, ' con ', maxVotosJuego, ' votos totales.');
End;

var
	v: videojuego;
Begin
	MasJuegosYVotos(v)							{a}
	PromedioVotosEducativosPorIdioma(v)			{b}
	NombreIdiomaJuegoMasVotado(v);				{c}
End.












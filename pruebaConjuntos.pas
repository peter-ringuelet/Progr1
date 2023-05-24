program copioArchivo;
var
archiE, archiS: Text;
linea: string[80];
begin
assign(archiE, 'C:\Users\Peter\Desktop\Facu\Progra 1');
assign(archiS, 'C:\Users\Peter\Desktop\Facu\Progra 1');
reset(archiE);
rewrite(archiS);
while not eof(archiE)
do begin
readLn(archiE,linea);
writeLn(archiS,linea);
end;
close(archiE);
close(archiS);
end.

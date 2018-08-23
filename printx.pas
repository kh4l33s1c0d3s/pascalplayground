program Dreieck(input,output);
{Liest eine natürliche Zahl n ein und gibt ein Dreieck aus 1+...+n X- Symbolen aus.}
var
  n, f:integer;
  i:integer;
  j:integer;
begin
	writeln('Geben Sie eine natürliche Zahl ein: '); 
	readln(n);
	for n:= n downto 1 do
	begin
		for j:= 1 to n do 
		write('X');
	writeln()
	end 
end.

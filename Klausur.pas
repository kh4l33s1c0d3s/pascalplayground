{Operationen die auf einem Feld ausgefuehrt werden koennen}
program FeldOperations(input, output);

uses

FeldUtilities;

const

Feldmax = 5;

type

tIndex = 1..Feldmax; 

tFeld = array [tIndex] of integer;

var 

Wert : integer;

Feld : tFeld = (1, 2, 3, 3, 5);

function WertSuchenPosition(inFeld : tFeld; inWert : integer) : integer;

var
	i : integer; 
	pos : integer; 
	
begin 
	for i:= 1 to Feldmax do
	begin 
		if inFeld[i] = Wert then
		begin 
			pos := i;
			writeln(pos);
		end;
	end;
WertSuchenPosition := pos;
end;



begin
Wert := 3;
WertSuchenPosition(Feld, Wert);
FeldAusgeben(Feld);
end.

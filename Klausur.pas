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

procedure FeldAusgeben(var inFeld);
var
i : integer;

begin 
	for i:= 1 to Feldmax do
	begin
		writeln(Feld[i]);
	end;
end;

procedure WertSuchenErsetzen(inWert:integer; var ioFeld:tFeld);
var
i : integer;

begin 
	for i := 1 to Feldmax do 
	begin
		if (Feld[i] = inWert) then 
		begin
			Feld[i] := 0;
		end
	end;
end;


begin
Wert := 3;
WertSuchenErsetzen(Wert, Feld);
FeldAusgeben(Feld);
end.

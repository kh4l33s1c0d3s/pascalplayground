unit FeldUtilities;
{This Unit offers all the helpfuctions/procedures you need to work with List of the Feld Type}

interface

const
Feldmax = 5;

type

tIndex = 1..Feldmax; 

tFeld = array [tIndex] of integer;



function Wertsuchen(inWert:integer; inFeld: tFeld): boolean;
procedure FeldAusgeben(var inFeld : tFeld);
procedure WertSuchenErsetzen(inWert:integer; var ioFeld:tFeld);


implementation 

{Wertsuchen und boolean zurueck geben}
function Wertsuchen(inWert:integer; inFeld: tFeld): boolean;
	var
	i : integer;
	gefunden : boolean; 
	
	begin
		gefunden := false; 
		for i := 1 to Feldmax do 
		begin 
			if ( inFeld[i] = inWert) then
			begin
				gefunden := true;
			end;
		
		end;
		Wertsuchen := gefunden;
		writeln(gefunden);
	end;
	
procedure FeldAusgeben(var inFeld:tFeld);
{Gibt Zahlen eines Feldes untereinander aus}
var
i : integer;

begin 
	for i:= 1 to Feldmax do
	begin
		writeln(inFeld[i]);
	end;
end;



procedure WertSuchenErsetzen(inWert:integer; var ioFeld:tFeld);
{Sucht bestimmten Wert in einem Feld un ersetzt diesen mit 0}
var
i : integer;

begin 
	for i := 1 to Feldmax do 
	begin
		if (ioFeld[i] = inWert) then 
		begin
			ioFeld[i] := 0;
		end
	end;
end;

function WertSuchenPosition(inFeld : tFeld; inWert : integer) : integer;
{Sucht bestimmten Wert in einer Liste und gibt die Position zurueck}
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


end.

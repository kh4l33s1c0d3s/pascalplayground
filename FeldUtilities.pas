unit FeldUtilities;
{This Unit offers all the helpfuctions/procedures you need to work with List of the Feld Type}

interface

const
Feldmax = 5;

type

tIndex = 1..Feldmax; 

tFeld = array [tIndex] of integer;



function Wertsuchen(inWert:integer; inFeld: tFeld): boolean;
procedure FeldAusgeben(var inFeld);
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
end.

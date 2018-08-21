unit FeldUtilities;
{This Unit offers all the helpfuctions/procedures you need to work with List of the Feld Type}

interface

Feldmax = 5;

type

tIndex = 1..Feldmax; 

tFeld = array [tIndex] of integer;

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

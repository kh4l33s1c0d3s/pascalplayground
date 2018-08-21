{Operationen die auf einem Feld ausgefuehrt werden koennen}


const

Feldmax = 5;

type

tIndex = 1..Feldmax; 

tFeld = array [tIndex] of integer;

var 

Wert : integer;

Feld : tFeld = (1, 2, 3, 4, 5);

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
begin
Wert := 3;
Wertsuchen(Wert, Feld);
end.

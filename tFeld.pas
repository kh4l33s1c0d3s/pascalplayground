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

procedure Tausch(inPos1 : integer; inPos2 : integer;var ioFeld : tFeld);

var

i, j : integer;
Wert1, Wert2 : integer;
iSpeicher, jSpeicher : integer;

begin
	 for i := 1 to Feldmax do
	 begin 
		if (i = inPos1) then
		begin
			Wert1 := ioFeld[i];
			iSpeicher := i;
		end;
	end;
	for j := 1 to Feldmax do
	begin
		if (j = inPos2) then 
		begin 
			Wert2 := ioFeld[j];
			jSpeicher := j;
		end;
	end;
	ioFeld[iSpeicher]:= Wert2;
	ioFeld[jSpeicher]:= Wert1;
end;



begin
Wert := 3;
WertSuchenPosition(Feld, Wert);
FeldAusgeben(Feld);
end.

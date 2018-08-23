program fibonaccifun(input, output);

type
tNatZahl = 0..maxint;

function itfibbonacci(inZahl : tNatZahl) : tNatZahl;

var
	vorletzte, letzte, aktuelle, i : tNatZahl;

begin
	if inZahl < 2 then
	begin
		aktuelle := inZahl;
	end
	else
	begin
		{intialisierung von f(0) und f(1)}
		vorletzte := 0;
		letzte := 1;
		
		for i := 2 to inZahl do 
		begin
			aktuelle := vorletzte + letzte;
			vorletzte := letzte;
			letzte := aktuelle; 
		end;
	end;
	itfibbonacci := aktuelle;
end;

function rekfibonacci(inZahl : tNatZahl) : tNatZahl;
var
	Ergebnis : tNatZahl;
begin
	Ergebnis := inZahl;
	if inZahl < 2 then
	begin
	end
	else
	begin 
	Ergebnis := rekfibonacci(Ergebnis - 1) + (Ergebnis - 2);
	end;
	rekfibonacci := Ergebnis;
end;

begin

writeln(itfibbonacci(3));
writeln(rekfibonacci(3));
end.

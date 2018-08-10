unit LinkedListUtilities;
{This Unit offers all the helpfuctions/procedures you need to work with LinkedLists}

interface
 
	const
	Max = 5;
 
	type
	tIndex = 1..Max;
	tFeld = array[tindex] of integer;
	tRefListe = ^tListe;
	tListe = record
			info : integer;
			next : tRefListe;
			end;
			
function ListeErstellen(inFeld : tFeld) : tRefListe;
procedure ListeAusgeben(var inRefListe : tRefListe);
function LengthOfLinkedListe(inRefListe : tRefListe) : integer;


implementation
	
function ListeErstellen(inFeld : tFeld) : tRefListe;
{ Liest array ein und schreibt Elemente in eine Verkettete List}
	var
	Feldgroesse : integer;
	i : integer;
	aktuellePosition : tRefListe;
	anfangsPosition: tRefListe;
	
	begin
	
	Feldgroesse := Length(inFeld);{Errechnet Groesse des Feldes}
	new(aktuellePosition);
		for i:= 1 to Feldgroesse do
		{Durchlaeuft Feld von Anfang bis Ende}
		begin
			if (i = 1) then
			begin
			anfangsPosition := aktuellePosition;
			end;
			{Erzeugt neues Objekt einer verketteten Liste}
			if (i = Feldgroesse) then
			begin
				aktuellePosition^.info := inFeld[i];
				aktuellePosition^.next := nil;
				{Erzeugt letztes Element der Liste und Setzt Zeiger auf nil}
			end
			else
			begin
				aktuellePosition^.info := inFeld[i];
				new(aktuellePosition^.next);
				aktuellePosition := aktuellePosition^.next;
				{Ordnet dem aktuellen Zeiger den naechsten Wert des einzulesenden Feldes zu. Erzeugt danach neu Position in der Liste und setzt den next Pointer des vorhergehenden Elemnts auf die neu Position}
			end;
		end;
	ListeErstellen:= anfangsPosition;
	end;




procedure ListeAusgeben(var inRefListe : tRefListe);
	var
	aktuellePosition : tRefListe;
	
	
	begin
		aktuellePosition := inRefListe;
		
		if (inRefListe <> nil) then
		begin
			while aktuellePosition <> nil do
			begin
				write('|', aktuellePosition^.info, '| -> ');
				aktuellePosition := aktuellePosition^.next;
			end;
			
		end
		
		else
		begin
			writeln('Liste ist leer, bitte machen Sie eine gueltige Eingabe');
		end;
			
	end;




function LengthOfLinkedListe(inRefListe : tRefListe) : integer;
{Gibt die Laenge einer Liste aus}

{Extra Credit Hilfsfunktion in eine Unit auslagern -> You need to google that ;)}
var
	Zaehler : integer;
begin
	Zaehler := 0;
	while (inRefListe <> nil) do
	begin
	Zaehler := Zaehler+1;
	inRefListe := inRefListe^.next;
	end;
	
LengthOfLinkedListe := Zaehler;
		
end;
end.

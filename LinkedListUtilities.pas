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
procedure addElement(inWert : integer; ioListe : tRefListe);
function ContainsElement(inWert : integer; inRefListe : tRefListe) : boolean;
procedure replaceElement(inWert : integer; inPosition: integer; var ioListe : tRefListe);


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
{Liest verkette Liste ein und gibt sie in Reihenfolge aus} 
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




procedure addElement(inWert : integer; ioListe : tRefListe);
{Fuegt Element am Ende einer Liste an}
var
aktuellePosition : tRefListe;


begin

	aktuellePosition := ioListe;
	
	while(aktuellePosition^.next <> nil) do
	begin
		aktuellePosition := aktuellePosition^.next;
		writeln(aktuellePosition^.info);
	end;
	new(aktuellePosition^.next);
	aktuellePosition^.next^.info := inWert;
	aktuellePosition^.next^.next := nil;
end;





function ContainsElement(inWert : integer; inRefListe : tRefListe) : boolean;
{Prueft ob ein Element in einer Lise enthalten ist}
var
aktuellePosition : tRefliste;
gefunden : boolean;
begin
	gefunden := true;
	aktuellePosition := inRefListe;
	if (aktuellePosition = nil) then
	{Prueft ob Liste leer ist}
	begin
		gefunden := false;
		writeln('Ungueltige Eingabe, bitte geben Sie ein nicht leere Liste ein')
	end;
	while (aktuellePosition^.next <> nil) do
	{Durchlaeuft Liste bis zu ihrem letzten Element}
	begin
		if (aktuellePosition^.info = inWert) then
		begin
			gefunden := true;
		end
		else
		begin
			aktuellePosition := aktuellePosition^.next
		end;
	end;
	
ContainsElement := gefunden;




procedure replaceElement(inWert : integer; inPosition: integer; var ioListe : tRefListe);
{Ersetzt Element an einer bestimmten Stelle mit einem neuen Elemet}
var
aktuellePosition : tRefListe;
aktuelleStelle : integer;
begin
	aktuellePosition := ioListe;
	aktuelleStelle := 0;
	while (aktuellePosition^.next <> nil) do
	{Durchlaeuft Liste bis zum letzten Element}
	begin
		aktuelleStelle := aktuelleStelle + 1;
		{Setzt den Wert aktuelle Stelle einen weiter um Positionen mit integer Werten bestimmen zu koennen}
		
		if (aktuelleStelle = inPosition) and (aktuellePosition^.info = inWert) then
		begin
			writeln('An dieser Stelle ist der Wert schon enthalten');
		end;
		if (aktuelleStelle = inPosition) then
		begin
			aktuellePosition^.info := inWert;
		end
		else
		begin
			aktuellePosition := aktuellePosition^.next;
		end;
	end;
end;

end;

end.

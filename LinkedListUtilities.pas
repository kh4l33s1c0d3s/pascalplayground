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
procedure insertElement(inWert : integer; inPositio: integer; var ioRefListe : tRefListe);
procedure deleteElement (inWert : integer; var ioRefListe : tRefListe);

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
var
aktuellePosition : tRefliste;
gefunden : boolean;
begin
	gefunden := true;
	aktuellePosition := inRefListe;
	if (aktuellePosition = nil) then
	begin
		gefunden := false;
		writeln('Ungueltige Eingabe, bitte geben Sie ein nicht leere Liste ein')
	end;
	while (aktuellePosition^.next <> nil) do
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

end;


procedure replaceElement(inWert : integer; inPosition: integer; var ioListe : tRefListe);
var
aktuellePosition : tRefListe;
aktuelleStelle : integer;
begin
	aktuellePosition := ioListe;
	aktuelleStelle := 0;
	while (aktuellePosition^.next <> nil) do
	begin
		aktuelleStelle := aktuelleStelle + 1;
		
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




procedure insertElement(inWert : integer; inPositio: integer; var ioRefListe : tRefListe);
{Fuegt Wert an bestimmte Stelle in der Liste ein und verschiebt bestehende Positionen entsprechend}
var
aktuellePosition : tRefListe;
hilfsPosition : tRefliste;
aktuelleStelle : integer;
begin
	aktuellePosition := ioRefListe;
	hilfsPosition := ioRefListe;
	aktuelleStelle := 0;
	
	while (aktuellePosition^.next <> nil) do
	begin
		aktuelleStelle := aktuelleStelle + 1;
		if ((aktuelleStelle +1) = inWert) then
		begin
			hilfsPosition := hilfsPosition^.next;
			new(aktuellePosition^.next);
			aktuellePosition^.next^.info := inWert;
			aktuellePosition := aktuellePosition^.next; 
			aktuellePosition^.next := hilfsPosition;
		end;
		aktuellePosition := aktuellePosition^.next;
		hilfsPosition := hilfsPosition^.next;	
	end;
end;

procedure deleteElement (inWert : integer; var ioRefListe : tRefListe);
var 
hilfsZeiger : tRefListe;
Zeiger : tRefListe;
begin
	hilfsZeiger := ioRefListe;
	Zeiger := ioRefListe;
	if (ioRefListe^.info = inWert) then 
	begin
		ioRefListe := ioRefListe^.next;
		dispose(hilfsZeiger);
	end;
	
	while (Zeiger^.next <> nil) and (Zeiger^.next^.info <> inWert) do 
	begin
			
			Zeiger := Zeiger^.next;
			hilfsZeiger := hilfsZeiger^.next;
	end;	
	hilfsZeiger := hilfsZeiger^.next;
	Zeiger^.next := Zeiger^.next^.next;
	dispose(hilfsZeiger);		
end;
	

end.

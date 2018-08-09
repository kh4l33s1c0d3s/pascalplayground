program VerketteteListe;
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
 var
 Zeiger : tRefListe;
 listWith5 : tFeld = (1,2,3,4,5);
 listWith1 : array[1..1] of integer = (1);
 
 
 
 { Hilfsprozeduren}
 
 procedure ListeErstellen(inFeld : tFeld;var ioRefListe : tRefListe);
{ Liest array ein und schreibt Elemente in eine Verkettete List}
	var
	Feldgroesse : integer;
	i : integer;
	aktuellePosition : tRefListe;
	anfangsPosition: tRefListe;
	
	begin
	
	Feldgroesse := Length(inFeld);{Errechnet Groesse des Feldes}
	aktuellePosition := ioRefListe;
		for i:= 1 to Feldgroesse do
		{Durchlaeuft Feld von Anfang bis Ende}
		begin
			new(aktuellePosition);
			if (i = 1) then
			begin
			anfangsPosition := aktuellePosition
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
	ioRefListe := anfangsPosition;
	end;



 
{Test Prozedure}
procedure ListeAusgeben(var ioRefListe : tRefListe);
	var
	aktuellePosition : tRefListe;
	
	
	begin
		aktuellePosition := ioRefListe;
		
		if (ioRefListe <> nil) then
		begin
			writeln('not null');
			while aktuellePosition^.next <> nil do
			begin
				writeln(aktuellePosition^.info);
				aktuellePosition := aktuellePosition^.next;
			end;
			
		end
		
		else
		begin
			writeln('Liste ist leer, bitte machen Sie eine gueltige Eingabe');
		end;
			
	end;

{Begin Hauptprogramm}
begin

ListeErstellen(listWith5, Zeiger);
ListeAusgeben(Zeiger);


{print "LinkedList Play Ground"}


writeln('LinkedList Playground');





{ Testcases }
{ Leere Liste }

{var emptyList := erzeugeListe(nil)}

{ Liste mit 5 elementen }

{var 
list := erzeugeListe([1,2,3,4,5])}

{ Zeigen liste an }

{listeAnzeigen('emptyList', emptyList)
listeAnzeigen(list)}

{emptyList: -> }
{list: -> |1| -> |2| -> |3| -> |4| -> |5| -> nil}







end.

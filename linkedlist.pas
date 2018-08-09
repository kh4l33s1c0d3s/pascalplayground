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
 idx : tindex;
 listWith5 : tFeld = (1,2,3,4,5);
 listWith1 : array[1..1] of integer = (1);
 
 
 
 { Hilfsprozeduren}
 
 procedure ListeErstellen(inFeld : tFeld;var ioRefListe : tRefListe);
{ Liest array ein und schreibt Elemente in eine Verkettete List}
	var
	Feldgroesse : integer;
	i : integer;
	aktuellePosition : tRefListe;
	
	begin
	
	writeln('Liste erstellen wurde aufgerufen');
	Feldgroesse := Length(inFeld);
	aktuellePosition := ioRefListe;
	writeln(Feldgroesse);
	
		for i:= 1 to Feldgroesse do
		begin
			new(aktuellePosition);
			if (i = Feldgroesse) then
			begin
				aktuellePosition^.info := inFeld[i];
				aktuellePosition^.next := nil;
				writeln(aktuellePosition^.info);
			end
			else
			begin
				aktuellePosition^.info := inFeld[i];
				writeln(aktuellePosition^.info);
				new(aktuellePosition^.next);
				aktuellePosition := aktuellePosition^.next;
			end;
		end;
	
	end;

begin

ListeErstellen(listWith5, Zeiger);  
 
{Test Prozedure}


{Begin Hauptprogramm}

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

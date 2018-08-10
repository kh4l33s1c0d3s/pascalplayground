program VerketteteListe;
uses
	LinkedListUtilities;
 
 var
 Zeiger : tRefListe;
 listWith5 : tFeld = (1,2,3,4,5);
 listWith1 : array[1..1] of integer = (1);
 
 


function insertElement(inWert : integer; inPosition: integer; inListe : tRefListe) : tRefListe;
var
aktuellePosition : tRefListe;
aktuelleStelle : integer;
anfangsPosition : tRefListe;
begin
	aktuellePosition := inListe;
	aktuelleStelle := 1;
	anfangsPosition := inListe;
	while aktuellePosition <> nil do
	begin
	
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
			aktuelleStelle := aktuelleStelle + 1;
		end;
	end;
		
insertElement := anfangsPosition;
end;
	

		
	
 
{Begin Hauptprogramm}
begin

writeln('LinkedList Playground');

Zeiger := ListeErstellen(listWith5);

ListeAusgeben(Zeiger);

writeln();

writeln('Die Liste hat ', LengthOfLinkedListe(Zeiger), ' Elemente');


addElement(6,Zeiger);

ListeAusgeben(Zeiger);

writeln();

writeln('Die Liste hat ', LengthOfLinkedListe(Zeiger), ' Elemente');


writeln(ContainsElement(6, Zeiger));

{insertElement(7, 2, Zeiger);

ListeAusgeben(Zeiger);}







{Funktion containselement Zahl uebergeben und nachschauen ob Zahl in Liste X}
{Funktion/Procedure addElement, Zahl ans Ende der Liste anfuegen}
{Funktion/Procedure insertElement, Zahl an bestimmter Stelle einfuegen}
end.

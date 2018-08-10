program VerketteteListe;
uses
	LinkedListUtilities;
 
 var
 Zeiger : tRefListe;
 listWith5 : tFeld = (1,2,3,4,5);
 listWith1 : array[1..1] of integer = (1);
 
 


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
	

		
	
 
{Begin Hauptprogramm}
begin

writeln('LinkedList Playground');

Zeiger := ListeErstellen(listWith5);

ListeAusgeben(Zeiger);

writeln();

writeln('Die Liste hat ', LengthOfLinkedListe(Zeiger), ' Elemente');


replaceElement(2, 2, Zeiger);

ListeAusgeben(Zeiger);


writeln('Die Liste hat ', LengthOfLinkedListe(Zeiger), ' Elemente');







{Funktion containselement Zahl uebergeben und nachschauen ob Zahl in Liste X}
{Funktion/Procedure addElement, Zahl ans Ende der Liste anfuegen}
{Funktion/Procedure insertElement, Zahl an bestimmter Stelle einfuegt und alle Zahlen danach ein weiter schiebt}
end.

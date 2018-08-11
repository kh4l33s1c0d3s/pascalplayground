program VerketteteListe;
uses
	LinkedListUtilities;
 
 var
 Zeiger : tRefListe;
 listWith5 : tFeld = (1,2,3,4,5);
 listWith1 : array[1..1] of integer = (1);
 		

	
 
{Begin Hauptprogramm}
begin

writeln('LinkedList Playground');

Zeiger := ListeErstellen(listWith5);

ListeAusgeben(Zeiger);

writeln();

writeln('Die Liste hat ', LengthOfLinkedListe(Zeiger), ' Elemente');


insertElement(2,4, Zeiger);


ListeAusgeben(Zeiger);



{Funktion/Procedure insertElement, Zahl an bestimmter Stelle einfuegt und alle Zahlen danach ein weiter schiebt}
end.

program VerketteteListe;
uses
	LinkedListUtilities;
 
 var
 Zeiger : tRefListe;
 listWith5 : tFeld = (1,4,6,4,1);
 listWith1 : array[1..1] of integer = (1);
 Reihenfolge : boolean;
 

 procedure sortListe(inReihenfolge : boolean; var ioRefListe : tRefListe);
{Bubble implementieren}
var
hauptZeiger : tRefListe;
nachZeiger : tRefListe;
position : integer; 
ZwischenSpeicher : integer;
begin
	
	hauptZeiger := ioRefListe;
	nachZeiger := ioRefListe^.next;
	
	{for position := 0 to (LengthOfLinkedListe(ioRefListe)* LengthOfLinkedListe(ioRefListe))do
	begin
	writeln(position);}
	
		while (nachZeiger <> nil)do
		begin
			if (hauptZeiger^.info > nachZeiger^.info) then
			{vertauschen der beiden Elemente}
			begin
				writeln ('Switch ', hauptZeiger^.info, 'und ',nachZeiger^.info );
				ZwischenSpeicher := hauptZeiger^.info;
				hauptZeiger^.info := nachZeiger^.info;
				nachZeiger^.info := ZwischenSpeicher;
				nachZeiger := nachZeiger^.next;
				
			
			end
			else
			begin
				nachZeiger := nachZeiger^.next;
				{writeln('Wert nachZeiger', nachZeiger^.info);}
		
			end;
			writeln();
			hauptZeiger := hauptZeiger^.next;
			writeln('Wert nachZeiger', hauptZeiger^.info);
		end;

	{end;}
end;

 
{Begin Hauptprogramm}
begin

writeln('LinkedList Playground');

Zeiger := ListeErstellen(listWith5);

ListeAusgeben(Zeiger);

writeln();

writeln('Die Liste hat ', LengthOfLinkedListe(Zeiger), ' Elemente');




ListeAusgeben(PascalReihe(Zeiger));




{sortListe ---> Zeiger und boolean Flag, wenn true dann aufsteigend wenn false dann absteigend}
end.

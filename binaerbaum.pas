program BinBaumfun(input, output);


uses
BinaryTreeUtilities;



var
root : tRefNode;

function rekBinBaumcheck (inRefBaum : tRefNode; inMaxBinBaum : integer) : boolean;
var
	{Reihenfolge : boolean;}
	Ergebnisl, ErgebnisR : boolean; 
	Zeiger : tRefNode;
	MaxBinBaum : integer;

begin
	Zeiger := inRefBaum;
	MaxBinBaum := inMaxBinBaum;	
	ErgebnisR := true;
	ErgebnisL := true;
	
	if (Zeiger^.info > MaxBinBaum) then
	begin
		MaxBinBaum := Zeiger^.info;
	
		if (Zeiger^.right <> nil) then 
		begin
			ErgebnisR := rekBinBaumcheck(Zeiger^.right, MaxBinBaum);
		
		end;

		if (Zeiger^.left <> nil)  then
		begin
			ErgebnisL := rekBinBaumcheck(Zeiger^.left, MaxBinBaum);
		end;
	end
	else
	begin
		ErgebnisR := false;
		ErgebnisL := false;	
	end;
	
	rekBinBaumcheck := ErgebnisR and ErgebnisL;
	
end;
	
begin
createTree(root);
printTree(root);
writeln(rekBinBaumcheck(root, 0));

end.
	

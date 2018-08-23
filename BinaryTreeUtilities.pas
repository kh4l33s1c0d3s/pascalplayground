unit BinaryTreeUtilities;

interface

type
 tRefNode = ^tNode;
 tNode = record
			info : integer;
			left : tRefNode;
			right: tRefNode;
			end;

procedure createTree(var ioRefNode : tRefNode);
procedure printTree(ioRefNode : tRefNode);

implementation

procedure createTree(var ioRefNode : tRefNode);
begin

	{root}
	new(ioRefNode);
	ioRefNode^.info := 1;
			
	{left}
	new(ioRefNode^.left);
	ioRefNode^.left^.info := 2;
	
	{left left}
	{new(ioRefNode^.left^.left);
	ioRefNode^.left^.left^.info := 4;}

	{left right}
	new(ioRefNode^.left^.right);
	ioRefNode^.left^.right^.info := 5;

	{right}
	new(ioRefNode^.right);
	ioRefNode^.right^.info := 3;

	{right left}
	new(ioRefNode^.right^.left);
	ioRefNode^.right^.left^.info := 6;
		
	{right right}
	new(ioRefNode^.right^.right);
	ioRefNode^.right^.right^.info := 7;	

end;

procedure printNode(ioRefNode : tRefNode; prefix: string; isTail: boolean);

begin
	if (isTail) then
	begin	
		writeln(prefix, '└── ', ioRefNode^.info);
	end
	else 
	begin
		writeln(prefix, '├── ', ioRefNode^.info);
	end;					
	
				
	if (ioRefNode^.right <> nil) then 
	begin			
		if (isTail) then
		begin
			printNode(ioRefNode^.right, prefix + '    ', false);
		end
		else
		begin
			printNode(ioRefNode^.right, prefix + '│   ', false);
		end;
	end; 
	
	if (ioRefNode^.left <> nil) then
	begin	
		if (isTail) then
		begin
			printNode(ioRefNode^.left, prefix + '    ', true);
		end
		else
		begin
			printNode(ioRefNode^.left, prefix + '│   ', true);
		end;
	end;
end;
                      

procedure printTree(ioRefNode : tRefNode);

begin
		printNode(ioRefNode, '', true);
end;

end.

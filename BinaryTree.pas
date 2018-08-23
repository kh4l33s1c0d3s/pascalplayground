program BinaryTree;
uses BinaryTreeUtilities;


var 
root: tRefNode;
   	
begin {Begin Hauptprogramm}

	writeln('BinaryTree Playground');
	writeln('');

	createTree(root);
	printTree(root);

end.

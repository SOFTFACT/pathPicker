C_TEXT:C284($t)

$t:=Select document:C905(8858;"";"Select a document to open:";0)

If (OK=1)
	
	Form:C1466.pathPicker.setType(Is a document:K24:1)
	Form:C1466.pathPicker.setMessage("Select a document to open:")
	Form:C1466.pathPicker.setPlaceholder("Please select a document")
	Form:C1466.pathPicker.setTarget(File:C1566(DOCUMENT;fk platform path:K87:2))
	
	(OBJECT Get pointer:C1124(Object named:K67:5;"type"))->:=2
	
End if 
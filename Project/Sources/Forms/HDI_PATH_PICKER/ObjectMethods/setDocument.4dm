C_TEXT:C284($t)

$t:=Select document:C905(8858;"";"Select a document to open:";0)

If (OK=1)
	
	Form:C1466.widget.setType(Is a document:K24:1)
	Form:C1466.widget.setMessage("Select a document to open:")
	Form:C1466.widget.setPlaceholder("Please select a document")
	
	Form:C1466.widget:=Form:C1466.widget.setTarget(File:C1566(DOCUMENT;fk platform path:K87:2))
	
	SET TIMER:C645(-1)
	
End if 
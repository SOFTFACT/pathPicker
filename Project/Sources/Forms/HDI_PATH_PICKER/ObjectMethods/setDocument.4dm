C_TEXT:C284($t)

$t:=Select document:C905("";"";"";0)

If (OK=1)
	
	Form:C1466.path.setPath(DOCUMENT)
	Form:C1466.path.setType(Is a document:K24:1)
	Form:C1466.path.setMessage("Select a document to open:")
	Form:C1466.path:=Form:C1466.path.setPlaceholder("Please select a document")
	
	  // Update UI
	SET TIMER:C645(-1)
	
End if 
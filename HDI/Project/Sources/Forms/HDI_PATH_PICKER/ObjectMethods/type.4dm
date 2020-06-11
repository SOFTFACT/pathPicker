C_LONGINT:C283($index)
$index:=Self:C308->-1

Form:C1466.pathPicker.setType($index)

  // Update placeholder and message according to the user choice

If ($index=Is a document:K24:1)
	
	Form:C1466.pathPicker.setMessage("Select file:")
	Form:C1466.pathPicker.setPlaceholder("Please select a file")
	
Else 
	
	Form:C1466.pathPicker.setMessage("Select folder:")
	Form:C1466.pathPicker.setPlaceholder("Please select a folder")
	
End if 
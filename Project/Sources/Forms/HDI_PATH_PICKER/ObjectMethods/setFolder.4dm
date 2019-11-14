C_TEXT:C284($t)

$t:=Select folder:C670("";"";0)

If (OK=1)
	
	Form:C1466.path.setPath($t)
	Form:C1466.path.setType(Is a folder:K24:2)
	Form:C1466.path.setMessage("Select folder:")
	Form:C1466.path:=Form:C1466.path.setPlaceholder("Please select a folder")
	
	  // Update UI
	SET TIMER:C645(-1)
	
End if 
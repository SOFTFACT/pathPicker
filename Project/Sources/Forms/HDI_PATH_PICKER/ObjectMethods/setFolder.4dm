C_TEXT:C284($t)

$t:=Select folder:C670("";"";0)

If (OK=1)
	
	Form:C1466.widget.setPath($t)
	Form:C1466.widget.setType(Is a folder:K24:2)
	Form:C1466.widget.setMessage("Select folder:")
	Form:C1466.widget:=Form:C1466.widget.setPlaceholder("Please select a folder")
	
	SET TIMER:C645(-1)
	
End if 
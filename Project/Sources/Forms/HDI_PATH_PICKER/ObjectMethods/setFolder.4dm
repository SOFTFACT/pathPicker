C_TEXT:C284($t)

$t:=Select folder:C670("Select a folder:";8858;0)

If (OK=1)
	
	Form:C1466.widget.setType(Is a folder:K24:2)
	Form:C1466.widget.setMessage("Select a folder:")
	Form:C1466.widget.setPlaceholder("Please select a folder")
	
	Form:C1466.widget:=Form:C1466.widget.setTarget(Folder:C1567($t;fk platform path:K87:2))
	
	SET TIMER:C645(-1)
	
End if 
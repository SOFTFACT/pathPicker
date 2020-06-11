C_TEXT:C284($t)

$t:=Select folder:C670("Select a folder:";8858;0)

If (OK=1)
	
	Form:C1466.pathPicker.setType(Is a folder:K24:2)
	Form:C1466.pathPicker.setMessage("Select a folder:")
	Form:C1466.pathPicker.setPlaceholder("Please select a folder")
	Form:C1466.pathPicker.setTarget(Folder:C1567($t;fk platform path:K87:2))
	
	(OBJECT Get pointer:C1124(Object named:K67:5;"type"))->:=1
	
End if 
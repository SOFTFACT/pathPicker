C_TEXT:C284($t)

For each ($t;Form:C1466.pathPicker.backup)
	
	If (Value type:C1509(Form:C1466.pathPicker.backup[$t])=Is object:K8:27)
		
		  // Make a copy
		Form:C1466.pathPicker[$t]:=OB Copy:C1225(Form:C1466.pathPicker.backup[$t])
		
	Else 
		
		Form:C1466.pathPicker[$t]:=Form:C1466.pathPicker.backup[$t]
		
	End if 
End for each 

(OBJECT Get pointer:C1124(Object named:K67:5;"type"))->:=1+Num:C11(Form:C1466.pathPicker.type)
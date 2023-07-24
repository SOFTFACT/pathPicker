// ----------------------------------------------------
// Form method : HDI_PATH_PICKER
// ID[6422098872994C57B8AC9F8BBA079A42]
// Created #9-9-2014 by Vincent de Lachaux
// ----------------------------------------------------
// Declarations
C_OBJECT:C1216($e)

// ----------------------------------------------------
// Initialisations
$e:=FORM Event:C1606

// ----------------------------------------------------

Case of 
		
		//______________________________________________________
	: ($e.code=On Load:K2:1)
		
		Form:C1466.pathPicker:=pathPicker(""; New object:C1471(\
			"options"; Package open:K24:8+Use sheet window:K24:11; \
			"fileTypes"; ".txt"; \
			"directory"; 8858; \
			"message"; "Select a file:"; \
			"placeHolder"; "Please select a .txt file"))
		
		GOTO OBJECT:C206(*; "")
		(OBJECT Get pointer:C1124(Object named:K67:5; "type"))->:=1+Num:C11(Form:C1466.pathPicker.type)
		
		
		Form:C1466.pathPicker2:=pathPicker(""; New object:C1471(\
			"options"; Package open:K24:8+Use sheet window:K24:11; \
			"fileTypes"; ".txt"; \
			"directory"; 8858; \
			"message"; "Select a file:"; \
			"placeHolder"; "Please select a .txt file"))
		
		
		// Keep initial values to allow a reset
		C_TEXT:C284($t)
		Form:C1466.pathPicker.backup:=New object:C1471
		
		For each ($t; Form:C1466.pathPicker)
			If (Value type:C1509(Form:C1466.pathPicker[$t])=Is object:K8:27)
				// Make a copy
				Form:C1466.pathPicker.backup[$t]:=OB Copy:C1225(Form:C1466.pathPicker[$t])
			Else 
				Form:C1466.pathPicker.backup[$t]:=Form:C1466.pathPicker[$t]
			End if 
		End for each 
		
		//______________________________________________________
	: ($e.code=On Clicked:K2:4)\
		 | ($e.code=On Data Change:K2:15)
		
		// Touch
		Form:C1466.pathPicker:=Form:C1466.pathPicker
		
		//______________________________________________________
		
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessary ("+$e.description+")")
		
		//______________________________________________________
End case 
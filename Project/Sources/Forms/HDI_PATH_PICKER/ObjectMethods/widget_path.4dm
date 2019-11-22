  // ----------------------------------------------------
  // Object method : HDI_PATH_PICKER.widget_path
  // ID[5AC07F61D04D4C29A136AA0B224F1384]
  // Created #9-9-2014 by Vincent de Lachaux
  // ----------------------------------------------------
  // Declarations
C_TEXT:C284($me;$t)
C_OBJECT:C1216($event;$o)

  // ----------------------------------------------------
  // Initialisations
$event:=FORM Event:C1606
$me:=OBJECT Get name:C1087(Object current:K67:2)

  // ----------------------------------------------------
Case of 
		
		  //……………………………………………………………………………………………
	: ($event.code=On Load:K2:1)
		
		  // Path to the initial target (can be empty)
		$t:=System folder:C487(Documents folder:K41:18)
		
		  // Options if any (can be omitted)
		$o:=New object:C1471(\
			"options";Package open:K24:8+Alias selection:K24:10+Use sheet window:K24:11;\
			"fileTypes";".txt";\
			"directory";8858;\
			"message";"Select a file:";\
			"placeHolder";"Please select a .txt file")
		
		Form:C1466.widget:=pathPicker ($t;$o)
		
		  //……………………………………………………………………………………………
	: ($event.code=On Data Change:K2:15)
		
		  // Update UI
		SET TIMER:C645(-1)
		
		  //……………………………………………………………………………………………
	Else 
		
		ASSERT:C1129(False:C215;"Form event activated unnecessary ("+String:C10($event.code)+")")
		
		  //……………………………………………………………………………………………
End case 
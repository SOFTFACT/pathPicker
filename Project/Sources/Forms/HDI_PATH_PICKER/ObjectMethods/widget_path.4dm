  // ----------------------------------------------------
  // Object method : HDI_PATH_PICKER.widget_path
  // ID[5AC07F61D04D4C29A136AA0B224F1384]
  // Created #9-9-2014 by Vincent de Lachaux
  // ----------------------------------------------------
  // Declarations
C_LONGINT:C283($bottom;$left;$Lon_event;$right;$top)
C_TEXT:C284($Txt_me)
C_OBJECT:C1216($o)

  // ----------------------------------------------------
  // Initialisations
$Lon_event:=Form event code:C388
$Txt_me:=OBJECT Get name:C1087(Object current:K67:2)

  // ----------------------------------------------------
Case of 
		
		  //______________________________________________________
	: ($Lon_event=On Load:K2:1)
		
		$o:=New object:C1471(\
			"type";Is a document:K24:1;\
			"options";Package selection:K24:9+Use sheet window:K24:11;\
			"directory";"8858";\
			"fileTypes";".txt";\
			"message";"Select a file:";\
			"placeHolder";"Please select a .txt file")
		
		Form:C1466.widget:=pathPicker ("";$o)
		
		  // Resize the widget
		OBJECT GET COORDINATES:C663(*;$Txt_me+".template";$left;$top;$right;$bottom)
		
		If (($left+$top+$right+$bottom)#0)
			
			OBJECT SET COORDINATES:C1248(*;$Txt_me;$left;$top;$right;$bottom)
			
		End if 
		
		  //______________________________________________________
	: ($Lon_event=On Data Change:K2:15)
		
		  // Update UI
		SET TIMER:C645(-1)
		
		  //______________________________________________________
		
	Else 
		
		ASSERT:C1129(False:C215;"Form event activated unnecessary ("+String:C10($Lon_event)+")")
		
		  //______________________________________________________
End case 
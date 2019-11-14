  // ----------------------------------------------------
  // Form method : PATH PICKER
  // ID[FA1AC624FC504898B4D7D3EF0766501C]
  // Created #9-9-2014 by Vincent de Lachaux
  // ----------------------------------------------------
  // Declarations
C_LONGINT:C283($bottom;$l;$left;$Lon_event;$right;$top)

  // ----------------------------------------------------
  // Initialisations
$Lon_event:=Form event code:C388

  // ----------------------------------------------------
Case of 
		
		  //______________________________________________________
	: ($Lon_event=On Load:K2:1)
		
		SET TIMER:C645(1)
		
		  //______________________________________________________
	: ($Lon_event=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		If (Bool:C1537(Form:C1466.browse))
			
			If (Not:C34(OBJECT Get visible:C1075(*;"browse")))
				
				OBJECT SET VISIBLE:C603(*;"browse";True:C214)
				
				OBJECT GET COORDINATES:C663(*;"browse";$left;$top;$right;$bottom)
				$right:=$left-5
				
				OBJECT GET COORDINATES:C663(*;"accessPath";$left;$top;$l;$bottom)
				OBJECT SET COORDINATES:C1248(*;"accessPath";$left;$top;$right;$bottom)
				
				OBJECT GET COORDINATES:C663(*;"border";$left;$top;$l;$bottom)
				OBJECT SET COORDINATES:C1248(*;"border";$left;$top;$right;$bottom)
				
			End if 
			
		Else 
			
			If (OBJECT Get visible:C1075(*;"browse"))
				
				OBJECT SET VISIBLE:C603(*;"browse";False:C215)
				
				OBJECT GET COORDINATES:C663(*;"browse";$left;$top;$right;$bottom)
				
				OBJECT GET COORDINATES:C663(*;"accessPath";$left;$top;$l;$bottom)
				OBJECT SET COORDINATES:C1248(*;"accessPath";$left;$top;$right;$bottom)
				
				OBJECT GET COORDINATES:C663(*;"border";$left;$top;$l;$bottom)
				OBJECT SET COORDINATES:C1248(*;"border";$left;$top;$right;$bottom)
				
			End if 
		End if 
		
		OBJECT SET PLACEHOLDER:C1295(*;"accessPath";String:C10(Form:C1466.placeHolder))
		
		  //______________________________________________________
	: ($Lon_event=On Resize:K2:27)
		
		SET TIMER:C645(-1)
		
		  //______________________________________________________
	: ($Lon_event=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		  //______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215;"Form event activated unnecessary ("+String:C10($Lon_event)+")")
		
		  //______________________________________________________
End case 
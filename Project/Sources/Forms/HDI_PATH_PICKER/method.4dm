  // ----------------------------------------------------
  // Form method : HDI_PATH_PICKER
  // ID[6422098872994C57B8AC9F8BBA079A42]
  // Created #9-9-2014 by Vincent de Lachaux
  // ----------------------------------------------------
  // Declarations
C_OBJECT:C1216($event)

  // ----------------------------------------------------
  // Initialisations
$event:=FORM Event:C1606

  // ----------------------------------------------------

Case of 
		
		  //______________________________________________________
	: ($event.code=On Load:K2:1)
		
		GOTO OBJECT:C206(*;"")
		
		SET TIMER:C645(-1)
		
		  //______________________________________________________
	: ($event.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		(OBJECT Get pointer:C1124(Object named:K67:5;"type"))->:=1+Num:C11(Form:C1466.widget.type)
		(OBJECT Get pointer:C1124(Object named:K67:5;"browse"))->:=Num:C11(Form:C1466.widget.browse)
		(OBJECT Get pointer:C1124(Object named:K67:5;"copyPath"))->:=Num:C11(Form:C1466.widget.copyPath)
		(OBJECT Get pointer:C1124(Object named:K67:5;"showOnDisk"))->:=Num:C11(Form:C1466.widget.showOnDisk)
		(OBJECT Get pointer:C1124(Object named:K67:5;"openItem"))->:=Num:C11(Form:C1466.widget.openItem)
		(OBJECT Get pointer:C1124(Object named:K67:5;"placeHolder"))->:=String:C10(Form:C1466.widget.placeHolder)
		
		  //______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215;"Form event activated unnecessary ("+String:C10($event.code)+")")
		
		  //______________________________________________________
End case 
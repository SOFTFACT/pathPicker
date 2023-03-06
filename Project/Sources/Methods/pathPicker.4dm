//%attributes = {"invisible":true,"shared":true}
var $0 : Object
var $1
var $2 : Object

//If (Count parameters=2)

//$0:=cs.pathPicker.new($1; $2)

//If (Count parameters=1)

//$0:=cs.pathPicker.new($1)

//Else 

//$0:=cs.pathPicker.new()

//End if 
//End if 


// ----------------------------------------------------
// Modified by: SOFTFACT (06.03.23, 09:44:42)
// ----------------------------------------------------
Case of 
	: (Count parameters:C259=2)
		
		$0:=cs:C1710.pathPicker.new($1; $2)
		
	: (Count parameters:C259=1)
		$0:=cs:C1710.pathPicker.new($1)
		
	: (True:C214)
		$0:=cs:C1710.pathPicker.new()
End case 

// ----------------------------------------------------

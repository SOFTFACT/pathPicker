//%attributes = {"invisible":true,"shared":true}
var $0 : Object
var $1
var $2 : Object

If (Count parameters:C259=2)
	
	$0:=cs:C1710.pathPicker.new($1;$2)
	
	If (Count parameters:C259=1)
		
		$0:=cs:C1710.pathPicker.new($1)
		
	Else 
		
		$0:=cs:C1710.pathPicker.new()
		
	End if 
End if 
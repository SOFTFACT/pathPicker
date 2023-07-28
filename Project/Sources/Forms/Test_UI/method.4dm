Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_OBJECT:C1216($o)
		$o:=New object:C1471
		$o.placeHolder:="Select the backup setting file…"
		$o.message:="Select a setting file…"
		$o.fileTypes:=".4DSettings"
		$o.directory:=1
		$o.type:=Is a document:K24:1
		$o.options:=Package open:K24:8+Use sheet window:K24:11
		//$o.formBelongsToTable:=->[Table_1]
		
		
		//Form.pathPicker.setType(Is a document)
		//Form.pathPicker.setMessage("Select a document to open:")
		//Form.pathPicker.setPlaceholder("Please select a document")
		//Form.pathPicker.setTarget(File(DOCUMENT; fk platform path))
		
		
		//C_OBJECT(test_pp_ui)
		//test_pp_ui:=pathPicker(File(Current backup settings file).platformPath; $o)
		
End case 

//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project method : pathPicker
  // ID[812130820250490A94BEE49CF68B0828]
  // Created 5-11-2019 by Vincent de Lachaux
  // ----------------------------------------------------
  // Description:
  //
  // ----------------------------------------------------
  // Declarations
C_OBJECT:C1216($0)
C_TEXT:C284($1)
C_OBJECT:C1216($2)

C_LONGINT:C283($Lon_;$bottom;$left)
C_TEXT:C284($popup;$t;$t;$t;$Txt_File;$Txt_path)
C_TEXT:C284($Txt_Separator;$Txt_Volume)
C_OBJECT:C1216($o)
C_COLLECTION:C1488($c)

ARRAY TEXT:C222($tTxt_volumes;0)

If (False:C215)
	C_OBJECT:C1216(pathPicker ;$0)
	C_TEXT:C284(pathPicker ;$1)
	C_OBJECT:C1216(pathPicker ;$2)
End if 

  // ----------------------------------------------------
If (This:C1470[""]=Null:C1517)  // Constructor
	
	$o:=New object:C1471(\
		"";"pathPicker";\
		"path";Null:C1517;\
		"accessPath";"";\
		"type";Is a document:K24:1;\
		"options";Package selection:K24:9+Use sheet window:K24:11;\
		"browse";True:C214;\
		"showOnDisk";True:C214;\
		"copyPath";True:C214;\
		"openItem";True:C214;\
		"directory";"8858";\
		"fileTypes";"";\
		"message";"";\
		"placeHolder";"";\
		"_lastPath";"";\
		"setPath";Formula:C1597(pathPicker ("setPath";New object:C1471("platformPath";String:C10($1))));\
		"setOption";Formula:C1597(pathPicker ("setOption";New object:C1471("enable";Bool:C1537($1);"option";String:C10($2))));\
		"setType";Formula:C1597(pathPicker ("setType";New object:C1471("type";$1)));\
		"setMessage";Formula:C1597(pathPicker ("setMessage";New object:C1471("message";$1)));\
		"setPlaceholder";Formula:C1597(pathPicker ("setPlaceholder";New object:C1471("placeHolder";$1)));\
		"_updateLabel";Formula:C1597(pathPicker ("_updateLabel";New object:C1471("value";String:C10($1))));\
		"_displayMenu";Formula:C1597(pathPicker ("_displayMenu"))\
		)
	
	If (Count parameters:C259=2)
		
		For each ($t;$2)
			
			$o[$t]:=$2[$t]
			
		End for each 
	End if 
	
Else 
	
	$o:=This:C1470
	
	Case of 
			
			  //______________________________________________________
		: ($o=Null:C1517)
			
			ASSERT:C1129(False:C215;"OOPS, this method must be called from a member method")
			
			  //______________________________________________________
		: ($1="setOption")
			
			$c:=New collection:C1472("";"browse";"showOnDisk";"copyPath";"openItem")
			
			Case of 
					
					  //……………………………………………………………………………………………………………………
				: ($2.option="all")\
					 | (Length:C16($2.option)=0)
					
					For each ($t;$c)
						
						If (Length:C16($t)>0)
							
							$o[$t]:=$2.enable
							
						End if 
					End for each 
					
					  //……………………………………………………………………………………………………………………
				Else 
					
					$o[$2.option]:=$2.enable
					
					  //……………………………………………………………………………………………………………………
			End case 
			
			  //______________________________________________________
		: ($1="setPath")
			
			$o.accessPath:=$2.platformPath
			
			Case of 
					
					  //……………………………………………………………………………………………………………………
				: (Test path name:C476($o.accessPath)=Is a document:K24:1)
					
					$o.path:=File:C1566($o.accessPath)
					
					  //……………………………………………………………………………………………………………………
				: (Test path name:C476($o.accessPath)=Is a folder:K24:2)
					
					$o.path:=Folder:C1567($o.accessPath)
					
					  //……………………………………………………………………………………………………………………
				Else 
					
					$o.path:=Null:C1517
					
					  //……………………………………………………………………………………………………………………
			End case 
			
			$o._updateLabel($o.accessPath)
			
			  //______________________________________________________
		: ($1="setType")
			
			$o.type:=Num:C11($2.type)
			
			  //______________________________________________________
		: ($1="setMessage")
			
			$o.message:=String:C10($2.message)
			
			  //______________________________________________________
		: ($1="setPlaceholder")
			
			$o.placeHolder:=String:C10($2.placeHolder)
			
			  //______________________________________________________
		: ($1="_updateLabel")
			
			$o.accessPath:=$2.value
			
			If (Length:C16($o.accessPath)>0)
				
				  // In remote mode, on macOS, the path can be in PC format if the server is on PC
				  // E:\Backup Base Rezs v11\Ressources_4D_v11[0373].4BK
				
				Case of 
						
						  //……………………………………………………………………………………………………………………
					: (Application type:C494=4D Remote mode:K5:5)\
						 & (Is macOS:C1572)\
						 & (Position:C15("\\";$o.accessPath)>0)
						
						$Txt_Separator:="\\"
						
						  //……………………………………………………………………………………………………………………
					: (Application type:C494=4D Remote mode:K5:5)\
						 & (Is Windows:C1573)\
						 & (Position:C15(":";Replace string:C233($o.accessPath;":";"";1))>0)
						
						$Txt_Separator:=":"
						
						  //……………………………………………………………………………………………………………………
					Else 
						
						$Txt_Separator:=Folder separator:K24:12
						
						  //……………………………………………………………………………………………………………………
				End case 
				
				VOLUME LIST:C471($tTxt_volumes)
				$c:=Split string:C1554($o.accessPath;$Txt_separator)
				
				$Txt_Volume:=$c[0]
				
				If ($o.path.isFile)
					
					$Txt_File:=$c[$c.length-1]
					
				Else 
					  //up one level
					$Txt_File:=$c[$c.length-1]
					
				End if 
				
				If ($Txt_File#$Txt_Volume)
					
					Form:C1466._label:=Replace string:C233(Replace string:C233(Get localized string:C991("FileInVolume");"{file}";$Txt_File);"{volume}";$Txt_Volume)
					
				Else 
					
					Form:C1466._label:="\""+$Txt_File+"\""
					
				End if 
				
				OBJECT SET VISIBLE:C603(*;"plus";True:C214)
				
			Else 
				
				Form:C1466._label:=""
				OBJECT SET VISIBLE:C603(*;"plus";False:C215)
				
			End if 
			
			  // Store the current path value
			Form:C1466._lastPath:=$o.accessPath
			
			  //______________________________________________________
		: ($1="_displayMenu")
			
			Case of 
					
					  //……………………………………………………………………………………………………………………
				: (Application type:C494=4D Remote mode:K5:5)\
					 & (Is macOS:C1572)\
					 & (Position:C15("\\";$o.accessPath)>0)
					
					$Txt_separator:="\\"
					
					  //……………………………………………………………………………………………………………………
				: (Application type:C494=4D Remote mode:K5:5)\
					 & (Is Windows:C1573)\
					 & (Position:C15(":";Replace string:C233($o.accessPath;":";"";1))>0)
					
					$Txt_separator:=":"
					
					  //……………………………………………………………………………………………………………………
				Else 
					
					$Txt_separator:=Folder separator:K24:12
					
					  //……………………………………………………………………………………………………………………
			End case 
			
			VOLUME LIST:C471($tTxt_volumes)
			$c:=Split string:C1554($o.accessPath;$Txt_separator)
			
			$popup:=Create menu:C408
			
			For each ($t;$c)
				
				If (Is Windows:C1573)
					
					APPEND MENU ITEM:C411($popup;$t)
					
				Else 
					
					INSERT MENU ITEM:C412($popup;0;$t)
					
				End if 
				
				  // Keep the item path
				$Txt_path:=$Txt_path+(Folder separator:K24:12*Num:C11(Length:C16($Txt_path)>0))+$t
				SET MENU ITEM PARAMETER:C1004($popup;-1;$Txt_path)
				
				Case of 
						
						  //……………………………………………………………………………………………………………………
					: (Find in array:C230($tTxt_volumes;$t)>0)
						
						SET MENU ITEM ICON:C984($popup;-1;"#images/widgets/path/drive.png")
						
						  //……………………………………………………………………………………………………………………
					: (Test path name:C476($Txt_path)=Is a folder:K24:2)
						
						SET MENU ITEM ICON:C984($popup;-1;"#images/widgets/path/folder.png")
						
						  //……………………………………………………………………………………………………………………
					: (Test path name:C476($Txt_path)=Is a document:K24:1)
						
						SET MENU ITEM ICON:C984($popup;-1;"#images/widgets/path/file.png")
						
						  //……………………………………………………………………………………………………………………
				End case 
				
				
				
				
			End for each 
			
			If (Count menu items:C405($popup)>0)
				
				If (Bool:C1537($o.showOnDisk))\
					 | (Bool:C1537($o.copyPath))
					
					APPEND MENU ITEM:C411($popup;"-")
					
				End if 
				
				If (Bool:C1537($o.showOnDisk))
					
					APPEND MENU ITEM:C411($popup;Get localized string:C991("ShowOnDisk"))
					SET MENU ITEM PARAMETER:C1004($popup;-1;"show")
					
				End if 
				
				If (Bool:C1537($o.copyPath))
					
					APPEND MENU ITEM:C411($popup;Get localized string:C991("CopyPath"))
					SET MENU ITEM PARAMETER:C1004($popup;-1;"copy")
					
				End if 
				
				OBJECT GET COORDINATES:C663(*;"border";$left;$top;$right;$bottom)
				CONVERT COORDINATES:C1365($left;$bottom;1;2)
				
				$t:=Dynamic pop up menu:C1006($popup;"";$left;$bottom-5)
				RELEASE MENU:C978($popup)
				
				Case of 
						
						  //……………………………………………………………………………………………………………………
					: (Length:C16($t)=0)
						
						  //……………………………………………………………………………………………………………………
					: ($t="copy")
						
						SET TEXT TO PASTEBOARD:C523($Txt_path)
						
						  //……………………………………………………………………………………………………………………
					: ($t="show")
						
						SHOW ON DISK:C922($Txt_path)
						
						  //……………………………………………………………………………………………………………………
					: (Not:C34(Bool:C1537($o.openItem)))
						
						  // NOTHING MORE TO DO
						
						  //……………………………………………………………………………………………………………………
					Else 
						
						SHOW ON DISK:C922($t)
						
						  //……………………………………………………………………………………………………………………
				End case 
			End if 
			
			  //______________________________________________________
		Else 
			
			ASSERT:C1129(False:C215;"Unknown entry point: \""+$1+"\"")
			
			  //______________________________________________________
	End case 
End if 

  // ----------------------------------------------------
  // Return
$0:=$o

  // ----------------------------------------------------
  // End
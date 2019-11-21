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

C_LONGINT:C283($bottom;$left;$right;$top)
C_TEXT:C284($popup;$t;$t;$Txt_path;$Txt_Separator;$Txt_Volume)
C_OBJECT:C1216($o;$Path_root)
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
		"platformPath";"";\
		"type";Null:C1517;\
		"options";Null:C1517;\
		"browse";Null:C1517;\
		"showOnDisk";Null:C1517;\
		"copyPath";Null:C1517;\
		"openItem";Null:C1517;\
		"directory";Null:C1517;\
		"fileTypes";"";\
		"message";"";\
		"placeHolder";"";\
		"target";Null:C1517;\
		"setPath";Formula:C1597(pathPicker ("setPath";New object:C1471("platformPath";String:C10($1))));\
		"setOption";Formula:C1597(pathPicker ("setOption";New object:C1471("enable";Bool:C1537($1);"option";String:C10($2))));\
		"setType";Formula:C1597(pathPicker ("setType";New object:C1471("type";$1)));\
		"setMessage";Formula:C1597(pathPicker ("setMessage";New object:C1471("message";$1)));\
		"setPlaceholder";Formula:C1597(pathPicker ("setPlaceholder";New object:C1471("placeHolder";$1)));\
		"updateLabel";Formula:C1597(pathPicker ("updateLabel";New object:C1471("value";String:C10($1))));\
		"displayMenu";Formula:C1597(pathPicker ("displayMenu"))\
		)
	
	  // Default values
	$o.type:=Is a document:K24:1
	
	$o.options:=Package selection:K24:9+Use sheet window:K24:11
	
	$o.browse:=True:C214
	$o.showOnDisk:=True:C214
	$o.copyPath:=True:C214
	$o.openItem:=True:C214
	$o.directory:=8858
	$o.fileTypes:=""
	
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
			
			$o.platformPath:=$2.platformPath
			$o.updateLabel($o.platformPath)
			
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
		: ($1="updateLabel")
			
			$o.platformPath:=$2.value
			
			If (Length:C16($o.platformPath)>0)
				
				  // In remote mode, on macOS, the path can be in PC format if the server is on PC
				  // E:\Backup Base Rezs v11\Ressources_4D_v11[0373].4BK
				
				Case of 
						
						  //……………………………………………………………………………………………………………………
					: (Application type:C494=4D Remote mode:K5:5)\
						 & (Is macOS:C1572)\
						 & (Position:C15("\\";$o.platformPath)>0)
						
						$Txt_Separator:="\\"
						
						  //……………………………………………………………………………………………………………………
					: (Application type:C494=4D Remote mode:K5:5)\
						 & (Is Windows:C1573)\
						 & (Position:C15(":";Replace string:C233($o.platformPath;":";"";1))>0)
						
						$Txt_Separator:=":"
						
						  //……………………………………………………………………………………………………………………
					Else 
						
						$Txt_Separator:=Folder separator:K24:12
						
						  //……………………………………………………………………………………………………………………
				End case 
				
				VOLUME LIST:C471($tTxt_volumes)
				$c:=Split string:C1554($o.platformPath;$Txt_separator;sk ignore empty strings:K86:1)
				
				$Txt_Volume:=$c[0]
				
				If (Test path name:C476($o.platformPath)=Is a document:K24:1)
					
					  //
					$o.target:=File:C1566($o.platformPath;fk platform path:K87:2)
					
				Else 
					
					$o.target:=Folder:C1567($o.platformPath;fk platform path:K87:2)
					
				End if 
				
				$t:=$c[$c.length-1]
				
				$o.label:=Choose:C955($t#$Txt_Volume;Replace string:C233(Replace string:C233(Get localized string:C991("FileInVolume");"{file}";$t);"{volume}";$Txt_Volume);"\""+$t+"\"")
				
				OBJECT SET VISIBLE:C603(*;"plus";True:C214)
				
			Else 
				
				$o.label:=""
				$o.target:=Null:C1517
				OBJECT SET VISIBLE:C603(*;"plus";False:C215)
				
			End if 
			
			  //______________________________________________________
		: ($1="displayMenu")
			
			Case of 
					
					  //……………………………………………………………………………………………………………………
				: (Application type:C494=4D Remote mode:K5:5)\
					 & (Is macOS:C1572)\
					 & (Position:C15("\\";$o.platformPath)>0)
					
					$Txt_separator:="\\"
					
					  //……………………………………………………………………………………………………………………
				: (Application type:C494=4D Remote mode:K5:5)\
					 & (Is Windows:C1573)\
					 & (Position:C15(":";Replace string:C233($o.platformPath;":";"";1))>0)
					
					$Txt_separator:=":"
					
					  //……………………………………………………………………………………………………………………
				Else 
					
					$Txt_separator:=Folder separator:K24:12
					
					  //……………………………………………………………………………………………………………………
			End case 
			
			VOLUME LIST:C471($tTxt_volumes)
			$c:=Split string:C1554($o.platformPath;$Txt_separator)
			
			$Path_root:=Folder:C1567(Temporary folder:C486;fk platform path:K87:2).folder(Generate UUID:C1066)
			$Path_root.create()
			
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
						
						  //$oo:=Folder($Txt_path;fk platform path)
						  //$p:=$oo.getIcon(32)
						  //$ooo:=$Path_root.file(Generate UUID)
						  //WRITE PICTURE FILE($ooo.platformPath;$p;".png")
						  //SET MENU ITEM ICON($popup;-1;"file://"+$ooo.target)
						
						  //……………………………………………………………………………………………………………………
					: (Test path name:C476($Txt_path)=Is a document:K24:1)
						
						SET MENU ITEM ICON:C984($popup;-1;"#images/widgets/path/file.png")
						
						  //$oo:=File($Txt_path;fk platform path)
						  //$p:=$oo.getIcon(32)
						  //$ooo:=$Path_root.file(Generate UUID)
						  //WRITE PICTURE FILE($ooo.platformPath;$p;".png")
						  //SET MENU ITEM ICON($popup;-1;"path:"+$ooo.target)
						
						  //……………………………………………………………………………………………………………………
				End case 
			End for each 
			
			$Path_root.delete(Delete with contents:K24:24)
			
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
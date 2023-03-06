//%attributes = {}
C_OBJECT:C1216($o)
$o:=New object:C1471
$o.placeHolder:="Select the backup setting file…"
$o.message:="Select a setting file…"
$o.fileTypes:=".4DSettings"
$o.directory:=1
$o.options:=Package open:K24:8+Use sheet window:K24:11
$o.formBelongsToTable:=->[Table_1:1]
C_OBJECT:C1216($pathPicker)
$pathPicker:=pathPicker(File:C1566(Current backup settings file:K5:29).platformPath; $o)

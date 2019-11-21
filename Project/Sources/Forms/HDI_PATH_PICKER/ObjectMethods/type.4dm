C_LONGINT:C283($l)

$l:=Self:C308->-1

Form:C1466.widget.setMessage(Choose:C955($l=Is a document:K24:1;"Select file:";"Select folder:"))
Form:C1466.widget.setPlaceholder(Choose:C955($l=Is a document:K24:1;"Please select a file";"Please select a folder"))
Form:C1466.widget:=Form:C1466.widget.setType($l)
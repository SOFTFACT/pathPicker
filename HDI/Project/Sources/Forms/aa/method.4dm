Form:C1466.pathPicker:=pathPicker(""; New object:C1471(\
"options"; Package open:K24:8+Use sheet window:K24:11; \
"fileTypes"; ".txt"; \
"directory"; 8858; \
"message"; "Select a file:"; \
"placeHolder"; "Please select a .txt file"))

GOTO OBJECT:C206(*; "")
(OBJECT Get pointer:C1124(Object named:K67:5; "type"))->:=1+Num:C11(Form:C1466.pathPicker.type)

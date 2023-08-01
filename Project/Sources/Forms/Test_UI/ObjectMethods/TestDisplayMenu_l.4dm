var $menuRef; $subMenu1; $t : Text
$menuRef:=Create menu:C408

APPEND MENU ITEM:C411($menuRef; "Line 1")



$subMenu1:=test_pp_ui.__buildMenu()

APPEND MENU ITEM:C411($menuRef; "Line 2"; $subMenu1)
$t:=Dynamic pop up menu:C1006($menuRef; "")
RELEASE MENU:C978($menuRef)

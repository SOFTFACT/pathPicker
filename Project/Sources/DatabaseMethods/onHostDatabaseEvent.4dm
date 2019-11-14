  // ----------------------------------------------------
  // Method : On Host Database Event - (4D unitTest)
  // ID[0180A55528F548F09596D4609CFA0985]
  // Created #1-6-2016 by Vincent de Lachaux
  // ----------------------------------------------------
  // Declarations
C_LONGINT:C283($1)

  // ----------------------------------------------------
  // Initialisations
COMPILER_component 

  // ----------------------------------------------------
Case of 
		
		  //______________________________________________________
	: ($1=On before host database startup:K74:3)
		
		  // The host database has just been started. The On Startup database method method
		  // Of the host database has not yet been called.
		  // The On Startup database method of the host database is not called while the On
		  // Host Database Event database method of the component is running
		
		ON BEFORE HOST STARTUP 
		
		  //______________________________________________________
	: ($1=On after host database startup:K74:4)
		
		  // The On Startup database method of the host database just finished running
		
		ON AFTER HOST STARTUP 
		
		  //______________________________________________________
	: ($1=On before host database exit:K74:5)
		
		  // The host database is closing. The On Exit database method of the host database
		  // Has not yet been called.
		  // The On Exit database method of the host database is not called while the On Host
		  // Database Event database method of the component is running
		
		  //______________________________________________________
	: ($1=On after host database exit:K74:6)
		
		  // The On Exit database method of the host database has just finished running
		
		ON AFTER HOST EXIT 
		
		  //______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215;"Unknown database event ("+String:C10($1)+")")
		
		  //______________________________________________________
End case 
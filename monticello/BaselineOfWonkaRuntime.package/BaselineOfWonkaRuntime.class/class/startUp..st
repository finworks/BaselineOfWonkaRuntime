system startup
startUp: resuming
	" This code needs to be present before Wonka-Squeak-Extensions and the like are loaded, else the image loading will
	fail with a dialog that needs an answer before we can proceed. 
	
	That is why the code is written so strangely to resolve the class by name, so the code can load cleanly under GemStone as well. "

	resuming
		ifTrue: [ #AioEventHandler asClass initializeAioPluginPresent ]
helper
writeInformationalBanner
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: '*** Loading ';
		nextPutAll: projectBaseName;
		cr;
		nextPutAll: '  From: ' , repository;
		cr;
		nextPutAll: '  Modes: ';
		nextPutAll: modes printString;
		cr.
	Transcript show: stream contents
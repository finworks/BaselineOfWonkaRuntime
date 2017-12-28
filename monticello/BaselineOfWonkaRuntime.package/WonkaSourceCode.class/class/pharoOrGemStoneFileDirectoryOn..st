utlity
pharoOrGemStoneFileDirectoryOn: pathName
	^ (Smalltalk includesKey: #FileDirectory)
		ifTrue: [ (Smalltalk at: #ServerFileDirectory ifAbsent: FileDirectory) on: pathName ]
		ifFalse: [ pathName perform: #asFileReference ]
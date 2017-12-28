accessing
wonkaDirectory: parent withSubDirectory: pathName
	^ (Smalltalk includesKey: #FileReference)
		ifTrue: [ parent / pathName ]
		ifFalse: [ parent class on: (parent fullNameFor: pathName) ]

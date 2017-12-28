as yet unclassified
doNotSkipOverDirtyPackagesDuring: aBlock
	aBlock
		on: MetacelloSkipDirtyPackageLoad
		do: [ :ex | 
			"never skip over dirty packages"
			ex resume: false ]
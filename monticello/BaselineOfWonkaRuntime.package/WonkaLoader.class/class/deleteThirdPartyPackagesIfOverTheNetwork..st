executing
deleteThirdPartyPackagesIfOverTheNetwork: overNetwork
	overNetwork
		ifTrue: [ 
			| toDelete |
			toDelete := WonkaSourceCode instance localPlatformSpecificThirdPartyPackagesDirectory.
			(toDelete class canUnderstand: #deleteAllChildren)
				ifTrue: [ toDelete perform: #deleteAllChildren ]
				ifFalse: [ self deleteDirectory: toDelete ] ]
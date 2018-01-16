executing
metacelloForLoading
	| result |
	result := metacello copy.
	self loadingOverNetwork
		ifTrue: [ result cacheRepository: 'filetree://', (WonkaSourceCode instance localPlatformSpecificThirdPartyPackagesDirectory fullName) ].
	^ result
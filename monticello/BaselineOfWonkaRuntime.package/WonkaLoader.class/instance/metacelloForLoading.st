executing
metacelloForLoading
	| result |
	result := metacello copy.
	self loadingOverNetwork
		ifTrue: [ result cacheRepository: WonkaSourceCode instance localPlatformSpecificThirdPartyPackagesDirectory fullName ].
	^ result
executing
loadGroup: aGroup
	warnings removeAll.
	self metacelloForLoading get.
	projectNamesAndWantedVersions := self computeProjectNamesAndWantedVersions.
	self
		handleUpgrade;
		handleDowngrade.
	self doWithPlatformModes: [ self doNotSkipOverDirtyPackagesDuring: [ self metacelloForLoading load: aGroup asString ] ].
	(modes includes: #lock)
		ifTrue: [ metacello lock ].
	warnings
		ifNotEmpty: [ 
			self class logMessage: '*** There were warnings during load ***'.
			warnings do: [ :each | self class logMessage: each ] ]
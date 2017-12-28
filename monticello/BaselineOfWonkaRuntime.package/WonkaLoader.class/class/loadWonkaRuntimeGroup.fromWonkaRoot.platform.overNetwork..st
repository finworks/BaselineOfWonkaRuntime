executing
loadWonkaRuntimeGroup: group fromWonkaRoot: localDirectory platform: aString overNetwork: overNetwork
	<lint: #WonkaImplementedNotSentRule rationale: 'Called from scripts'>
	<lint: #RBBadMessageRule rationale:
		'Performing and canUnderstand: is used to write cross-platform compatibility code at a point in time when our other compatibility layers are not yet loaded'>
	WonkaSourceCode ensureInitializedSingletonForPlatform: aString.
	WonkaSourceCode instance setWonkaRootFromString: localDirectory.
	WonkaSourceCode instance shouldLoadRuntime
		ifTrue: [ 
			| modes |
			modes := overNetwork
				ifTrue: [ #(#overNetwork) ]
				ifFalse: [ #() ].
			self
				logMessage:
						'Loading runtime version ' , WonkaSourceCode instance currentRuntimeVersion , ' from '
								, WonkaSourceCode instance loadedRuntimeVersion asString;
				deleteThirdPartyPackagesIfOverTheNetwork: overNetwork;
				updateBootstrapDependenciesModes: modes;
				ensureNewConfigurationsLoaded;
				loadWonkaRuntimeGroup: group modes: modes.
			WonkaSourceCode instance setLoadedRuntimeVersion ]
		ifFalse: [ self logMessage: 'Skip loading of runtime version ' , WonkaSourceCode instance currentRuntimeVersion ]

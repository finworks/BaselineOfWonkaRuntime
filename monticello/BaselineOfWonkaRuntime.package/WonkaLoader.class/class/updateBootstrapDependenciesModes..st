executing
updateBootstrapDependenciesModes: modes
	WonkaSourceCode instance isOnPharoPlatform
		ifTrue: [ self updatePharoBootstrapDependencies ]
		ifFalse: [ self updateGemStoneBootstrapDependenciesModes: modes ]
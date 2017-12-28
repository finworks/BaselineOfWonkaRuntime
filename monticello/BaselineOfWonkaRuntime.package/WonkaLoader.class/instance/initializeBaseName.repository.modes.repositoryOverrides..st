initialize-release
initializeBaseName: theProjectBaseName repository: theRepository modes: theModes repositoryOverrides: repositoryOverrides
	projectBaseName := theProjectBaseName.
	repository := theRepository.
	modes := theModes.
	self writeInformationalBanner.
	warnings := OrderedCollection new.
	metacello := Metacello new
		baseline: projectBaseName;
		repository: repository;
		yourself.
	self loadingOverNetwork
		ifFalse: [ metacello repositoryOverrides: repositoryOverrides ].
	self
		handleWonkaLoadConflict;
		honourLocks;
		handleWarnings
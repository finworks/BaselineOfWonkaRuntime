executing
loadGemStoneMetacelloPreviewBootstrap
	| repository version |
	Transcript show: '*** Loading Metacello preview bootstrap'.
	repository := MCDirectoryRepository new directory: WonkaSourceCode instance localMetacelloPreviewBootstrapDirectory.
	(repository versionFromFileNamed: 'ConfigurationOfMetacello-dkh.800.mcz') load.
	version := (Smalltalk at: #ConfigurationOfMetacello) project version: #previewBootstrap.
	version
		cacheRepository: repository;
		load
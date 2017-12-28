executing
bootstrapZipArchiveIntoNewPackageForGemStone
	" Around Feb 2015 ZipArchive needed to move from Core to Gemstone-Compression. But since ZipArchive itself is used to implement
	MCZ file reading, the whole process bombs when using Metacello to load them while simultaneously caching MCZs. (These typically
	manifest as ZipArchive doesNotUnderstand: #readFrom:). "

	| repository |
	Transcript show: '*** ZipArchive fuckery start'.
	repository := MCFileTreeRepository new directory: WonkaSourceCode instance localThirdPartyGLASSDirectory.
	(repository versionFromFileNamed: 'GemStone-Compression.package') load.
	Transcript show: '*** ZipArchive fuckery done'
executing
loadGemStoneMetacelloPreview
	Transcript show: '*** Loading Metacello preview'.
	Metacello new
		configuration: 'MetacelloPreview';
		version: #stable;
		repository: WonkaSourceCode instance localMetacelloPreviewRepository;
		load
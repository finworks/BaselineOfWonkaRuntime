executing
updateGemStoneBootstrapDependenciesModes: modes
	" This sort-of duplicates what GsUpgrader upgradeGrease; upgradeGLASS1 would do."

	self
		loadBootstrapBaseline: 'GsUpgrader'
		repository: WonkaSourceCode instance localThirdPartyGsUpgraderRepository
		modes: modes.
	(Smalltalk at: #GsUpgrader) new perform: #patchForGsDevKitIssue60.
	self metacelloPreviewLoaded
		ifFalse: [ 
			self
				loadGemStoneMetacelloPreviewBootstrap;
				loadGemStoneMetacelloPreview ].
	self
		loadBootstrapBaseline: 'FileTree'
		repository: WonkaSourceCode instance localThirdPartyFileTreeRepository
		modes: modes.
	self
		loadBootstrapBaseline: 'Metacello'
		repository: WonkaSourceCode instance localThirdPartyMetacelloRepository
		modes: modes.
	self loadBootstrapBaseline: 'Grease' repository: WonkaSourceCode instance localThirdPartyGreaseRepository modes: modes.
	self glass1Loaded
		ifFalse: [ self bootstrapZipArchiveIntoNewPackageForGemStone ].
	self loadBootstrapBaseline: 'GLASS1' repository: WonkaSourceCode instance localThirdPartyGLASSRepository modes: modes
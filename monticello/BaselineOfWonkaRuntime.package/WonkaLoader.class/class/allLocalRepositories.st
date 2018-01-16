executing
allLocalRepositories
	^ {(WonkaSourceCode instance localThirdPartyFileTreeRepository).
	(WonkaSourceCode instance localThirdPartyMetacelloRepository).
	(WonkaSourceCode instance localThirdPartyGsUpgraderRepository).
	(WonkaSourceCode instance localThirdPartyGreaseRepository).
	(WonkaSourceCode instance localThirdPartyGLASSRepository).
	('filetree://', (WonkaSourceCode instance localPlatformSpecificThirdPartyPackagesDirectory fullName))}

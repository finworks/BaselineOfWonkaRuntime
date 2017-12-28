executing
allLocalRepositories
	^ {(WonkaSourceCode instance localThirdPartyFileTreeRepository).
	(WonkaSourceCode instance localThirdPartyMetacelloRepository).
	(WonkaSourceCode instance localThirdPartyGsUpgraderRepository).
	(WonkaSourceCode instance localThirdPartyGreaseRepository).
	(WonkaSourceCode instance localThirdPartyGLASSRepository).
	(WonkaSourceCode instance localThirdPartySeaside31Repository).
	(WonkaSourceCode instance localPlatformSpecificThirdPartyPackagesDirectory fullName)}

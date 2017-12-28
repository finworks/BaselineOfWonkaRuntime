accessing
localGofer
	| gofer |
	gofer := Gofer it.
	gofer disablePackageCache.
	gofer repository: self localWonkaCodeRepository.
	^ gofer

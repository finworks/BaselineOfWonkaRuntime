executing
ensureNewConfigurationsLoaded
	"This is necesarry, because if a database already has some older version of ConfigurationOfFoo loaded, nothing else will force it to
	load and use the same ConfigurationOfFoo that we have on disk. Amongst other things this means production deploys will use different
	ConfigurationOf files."

	<lint: #WonkaCodeCruftLeftInMethodsRule rationale: 'Necessarry logging during loading'>
	| repository |
	repository := MCFileTreeRepository new
		directory: WonkaSourceCode instance localPlatformSpecificThirdPartyPackagesDirectory.	" We need to load these in a stable order, otherwise deploys etc. on working directories where the files in the directory list in
	a different order can behave differently (this has already happened).
	
	FIXME: Just using alphabetical order as our stable order is a bit arbitrary, though. "
	repository allFileNames asSortedCollection
		do: [ :each | 
			((each beginsWith: 'ConfigurationOf') or: [ each beginsWith: 'BaselineOf' ])
				ifTrue: [ 
					Transcript
						show: 'Loading ';
						show: each.
					(repository versionFromFileNamed: each) load ] ]
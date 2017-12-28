helper
computeProjectNamesAndWantedVersions
	" This abomination tries to introspect BaselineOf... and find all configurations and baselines we depend on, and their version. 
	This looks like it could be heavily refactored not to break Metacello encapsulation so much. "

	| baselineClassName baselineClass packagesAndProjectsWeWant projectsWeWant result |
	baselineClassName := 'BaselineOf' , projectBaseName.
	baselineClass := Smalltalk at: baselineClassName asSymbol.
	baselineClass isNil
		ifTrue: [ self error: 'Cannot compute dependencies of ' , baselineClassName , ' since it has not been loaded yet.' ].
	result := Dictionary new.
	packagesAndProjectsWeWant := (baselineClass project map at: 'baseline') spec packagesSpec list
		collect: [ :each | each spec ].
	projectsWeWant := (packagesAndProjectsWeWant select: [ :each | each isKindOf: MetacelloProjectReferenceSpec ])
		collect: [ :each | each projectReference ].
	(projectsWeWant select: [ :each | each className notNil ])
		do: [ :each | result at: each className put: each versionString ].
	^ result
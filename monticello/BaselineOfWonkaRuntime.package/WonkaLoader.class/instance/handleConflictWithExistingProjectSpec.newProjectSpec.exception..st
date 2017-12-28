helper
handleConflictWithExistingProjectSpec: existingProjectSpec newProjectSpec: newProjectSpec exception: ex
	| useNew |
	" Stick with what we've got. Unless we're upgrading configurations to baselines, which we always consider to be an improvement. "
	useNew := (existingProjectSpec className beginsWith: 'ConfigurationOf')
		and: [ newProjectSpec className beginsWith: 'BaselineOf' ].
	self class
		logMessage:
			'Conflict between existing: ' , existingProjectSpec className , ' ' , existingProjectSpec printString
				, Character cr asString , '  and new: ' , newProjectSpec className , ' ' , newProjectSpec printString
				, Character cr asString , '  resolved in favor of '
				,
					(useNew
						ifTrue: [ 'new' ]
						ifFalse: [ 'existing' ]).
	useNew
		ifTrue: [ ex allow ]
		ifFalse: [ ex disallow ]
helper
honourLocks
	<lint: #RBBadMessageRule rationale:
		'Metacello api does not understand onWarning: until later on in the load process.'>
	(metacello class canUnderstand: #onLock:)
		ifTrue: [ 
			metacello
				onLock: [ :ex | 
					self class
						logMessage:
							'LOCK ENFORCED: Attempt to ' , ex operationString printString , ' new project: ' , ex newProjectRegistration printString
								, ' when existing project: ' , ex existingProjectRegistration printString , ' is locked.'.
					ex allow ] ]
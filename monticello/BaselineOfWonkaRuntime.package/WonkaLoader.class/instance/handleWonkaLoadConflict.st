helper
handleWonkaLoadConflict
	metacello
		onConflict: [ :ex :existingRegistration :newRegistration | 
			self
				handleConflictWithExistingProjectSpec:
					(existingRegistration baselineProjectSpec ifNil: [ existingRegistration configurationProjectSpec ])
				newProjectSpec: (newRegistration baselineProjectSpec ifNil: [ newRegistration configurationProjectSpec ])
				exception: ex ]
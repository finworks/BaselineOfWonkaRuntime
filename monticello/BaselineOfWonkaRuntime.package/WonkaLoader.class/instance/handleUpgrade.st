helper
handleUpgrade
	metacello
		onUpgrade: [ :ex :existingRegistration :newRegistration | 
			self
				handleVersionChange: ex
				existing: existingRegistration
				new: newRegistration
				default: true
				description: 'Upgrade' ]

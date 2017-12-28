helper
handleDowngrade
	metacello
		onDowngrade: [ :ex :existingRegistration :newRegistration | 
			self
				handleVersionChange: ex
				existing: existingRegistration
				new: newRegistration
				default: false
				description: 'Downgrade' ]

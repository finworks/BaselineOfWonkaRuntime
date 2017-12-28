helper
handleVersionChange: ex existing: existingRegistration new: newRegistration default: aBoolean description: aString
	projectBaseName = 'WonkaRuntime'
		ifTrue: [ 
			(self wantProjectRegistration: newRegistration default: aBoolean)
				ifTrue: [ 
					self class
						logMessage:
							aString , ' ' , existingRegistration nameAndVersionString , ' -> ' , newRegistration nameAndVersionString.
					ex allow ]
				ifFalse: [ 
					self class
						logMessage:
							'! Blocking ' , aString , ' ' , existingRegistration nameAndVersionString , ' -> '
								, newRegistration nameAndVersionString.
					ex disallow ] ]
		ifFalse: [ 
			aBoolean
				ifTrue: [ ex allow ]
				ifFalse: [ ex disallow ] ]
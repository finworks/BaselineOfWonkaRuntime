helper
handleWarnings
	<lint: #RBBadMessageRule rationale: 'Metacello api does not understand onWarning: until later on in the load process.'>
	(metacello class canUnderstand: #onWarning:)
		ifTrue: [ 
			metacello
				onWarning: [ :ex | 
					ex class == MCMergeOrLoadWarning
						ifTrue: [ ex resume: true ]
						ifFalse: [
						    | msg |
						    msg := ex description.
							self class logMessage: msg.
							warnings add: msg.
							ex resume ] ] ]

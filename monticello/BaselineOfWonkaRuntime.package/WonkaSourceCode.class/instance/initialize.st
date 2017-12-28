initialization
initialize
	super initialize.
	loadedRuntimeVersion := self class instance ifNotNil: [ 'old version' ] ifNil: [ 'none' ]
helper
wantProjectRegistration: existingRegistration default: aBoolean
	| wantedVersion className |
	className := (existingRegistration configurationProjectSpec ifNil: [ existingRegistration baselineProjectSpec ])
		className.
	wantedVersion := projectNamesAndWantedVersions at: className ifAbsent: [ ^ aBoolean ].
	^ existingRegistration version asString = wantedVersion	" Fixme: this does not take into account the fact that a symbolic version may be an alias for another version number "
accessing
projectNamesAndWantedVersions
	^ projectNamesAndWantedVersions ifNil: [ projectNamesAndWantedVersions := self computeProjectNamesAndWantedVersions ]
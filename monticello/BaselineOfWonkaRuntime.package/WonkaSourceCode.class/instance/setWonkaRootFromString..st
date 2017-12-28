accessing
setWonkaRootFromString: aWonkaRoot
	wonkaRoot := self class pharoOrGemStoneFileDirectoryOn: aWonkaRoot.
	wonkaRoot exists
		ifFalse: [ self error: 'Directory ' , aWonkaRoot , ' does not exist.' ]
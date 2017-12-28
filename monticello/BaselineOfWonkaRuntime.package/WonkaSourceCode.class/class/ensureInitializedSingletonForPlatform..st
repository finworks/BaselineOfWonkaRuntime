instance creation
ensureInitializedSingletonForPlatform: platform
	(instance notNil and: [ self == instance class ])
		ifTrue: [ 
			instance platform = platform
				ifFalse: [ 
					"Only GemStone images can legally change platform, i.e. when they go from one GemStone version to another."
					self assert: instance isOnGemStonePlatform.
					instance platform: platform.
					self assert: instance isOnGemStonePlatform ] ]
		ifFalse: [ 
			instance := self new
				initialize;
				platform: platform;
				yourself ]
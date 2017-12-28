executing
doWithPlatformModes: aBlock
	| mcPlatformSupport |
	mcPlatformSupport := Smalltalk at: #MCPlatformSupport ifAbsent: [ nil ].
	^ mcPlatformSupport isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ 
			| platformModes originalModes |
			platformModes := #(#autoCommit) , (modes intersection: #(#autoMigrate)).
			originalModes := Dictionary
				newFrom: (platformModes collect: [ :eachMode | eachMode -> (mcPlatformSupport perform: eachMode) ]).
			platformModes do: [ :eachMode | mcPlatformSupport perform: (eachMode , #':') asSymbol with: true ].
			aBlock
				ensure: [ 
					platformModes
						do: [ :eachMode | mcPlatformSupport perform: (eachMode , #':') asSymbol with: (originalModes at: eachMode) ] ] ]
executing
deleteDirectory: aDirectory
    aDirectory deleteLocalFiles.
    aDirectory entries do: [ :entry|
       self deleteDirectory: (aDirectory directoryNamed: entry name).
       aDirectory deleteDirectory: (entry name)
    ]
accessing
fileTreeRepositoryNameForBaseName: repositoryBaseName
	^ 'filetree://' , (self thirdPartyDirectoryWithBaseName: repositoryBaseName) fullName
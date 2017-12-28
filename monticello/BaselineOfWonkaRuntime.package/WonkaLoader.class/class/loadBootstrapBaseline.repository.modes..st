executing
loadBootstrapBaseline: componentName repository: repository modes: modes
	self new
		initializeBaseName: componentName
			repository: repository
			modes: modes , #(#autoMigrate #lock)
			repositoryOverrides: self allLocalRepositories;
		loadGroup: #default
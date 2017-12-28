executing
lockRepositories
	" Workaround: Magritte3 tries to fetch ConfigurationOfFilesystem from http://www.squeaksource.com/MetacelloRepository/,
        but there are only old ConfigurationOfs there and they dont mention the #stable version that Magritte depends on. "

	Metacello new
		configuration: 'Filesystem';
		repository: 'http://www.squeaksource.com/fs/';
		version: #stable;
		lock
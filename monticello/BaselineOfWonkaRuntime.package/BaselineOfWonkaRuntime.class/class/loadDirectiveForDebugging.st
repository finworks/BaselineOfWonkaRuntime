accessing
loadDirectiveForDebugging
	<lint: #WonkaImplementedNotSentRule rationale: 'This method is called manually for debugging'>
	| version |
	version := self project latestVersion
		ignoreImage: true;
		yourself.
	^ (version record: 'CI') loadDirective
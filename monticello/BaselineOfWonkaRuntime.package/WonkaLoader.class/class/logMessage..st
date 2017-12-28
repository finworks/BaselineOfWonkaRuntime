helper
logMessage: message
	<lint: #WonkaCodeCruftLeftInMethodsRule rationale: 'Necessarry logging during loading'>
	Transcript
		cr;
		show: message
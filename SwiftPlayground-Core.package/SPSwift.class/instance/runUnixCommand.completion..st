private - utilities
runUnixCommand: aString completion: aCompletionBlock
	OSSUnixSubprocess new
		shellCommand: aString;
		redirectStdout;
		redirectStderr;
		runAndWaitOnExitDo:
			[ :process :outString :errString | 
			process isSuccess
				ifTrue: [ aCompletionBlock value: outString value: nil ]
				ifFalse: [ aCompletionBlock value: nil value: errString ]
			]
public
retrieveOutputWith: aCompletionBlock
	self
		runUnixCommand: 'swift "' , self createFile , '"'
		completion:
			[ :output :error | 
			output ifNotNil: [ aCompletionBlock value: output ].
			error
				ifNotNil: [ "Error signal: (self readableErrorFrom: error)" aCompletionBlock value: error ]
			]
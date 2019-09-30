public
retrieveASTWith: aCompletionBlock
	self
		runUnixCommand: 'swiftc -dump-parse "' , self createFile , '" | cat'
		completion: [ :output :error | 
			output
				ifNotNil: [ aCompletionBlock
						value:
							(self readableASTFrom: output fullFilePath: self fullFilePath pathString)
					].
			error ifNotNil: [ Error signal: error ]
			]
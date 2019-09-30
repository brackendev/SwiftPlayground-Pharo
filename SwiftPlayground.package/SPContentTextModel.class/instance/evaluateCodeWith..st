do-its
evaluateCodeWith: aCompletionBlock
	SwiftPlayground shared
		evaluate: self retrieveSelection
		completion: [ :output | aCompletionBlock value: output ]
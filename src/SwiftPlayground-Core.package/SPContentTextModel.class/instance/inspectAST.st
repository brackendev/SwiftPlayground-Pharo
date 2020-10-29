do-its
inspectAST
	SwiftPlayground shared
		retrieveASTFor: self retrieveSelection
		completion: [ :output | output inspect ]
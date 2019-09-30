private
evaluate: aSwiftCode completion: aCompletionBlock
	| swift |
	swift := SPSwift createWith: aSwiftCode.
	swift
		retrieveOutputWith: [ :output | aCompletionBlock value: output ]
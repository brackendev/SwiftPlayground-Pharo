private
retrieveASTFor: aSwiftCode completion: aCompletionBlock
	| swift |
	swift := SPSwift createWith: aSwiftCode.
	swift retrieveASTWith: [ :output | aCompletionBlock value: output ]
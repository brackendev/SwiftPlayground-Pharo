private
retrieveASTFor: aSwiftCode completion: aCompletionBlock
	UIManager default
		showWaitCursorWhile: [ | swift | 
			swift := SPSwift createWith: aSwiftCode.
			swift retrieveASTWith: [ :output | aCompletionBlock value: output ]
			]
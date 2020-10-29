private
evaluate: aSwiftCode completion: aCompletionBlock
	UIManager default
		showWaitCursorWhile: [ | swift |
			swift := SPSwift createWith: aSwiftCode. 
			swift
				retrieveOutputWith: [ :output | aCompletionBlock value: output ]
			]
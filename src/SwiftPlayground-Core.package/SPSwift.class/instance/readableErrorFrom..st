private - utilities
readableErrorFrom: anErrorString
	| matcher |
	matcher := RxMatcher forString: '(.*[:]\d*[:]\d*[:]\s.*[:]\s)(.*)'.
	(matcher matches: anErrorString)
		ifTrue:
			[ matcher subexpressionCount > 2
				ifTrue: [ ^ self cleanupError: ((matcher subexpression: 3) capitalized) ]
			].
	^ self cleanupError: anErrorString
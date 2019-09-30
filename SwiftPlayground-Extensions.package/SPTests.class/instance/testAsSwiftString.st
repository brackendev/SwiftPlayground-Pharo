tests
testAsSwiftString
	self assert: 'Hello, World!' asSwiftString equals: '"Hello, World!"'.
	self assert: '1+1' asSwiftString equals: '"1+1"'
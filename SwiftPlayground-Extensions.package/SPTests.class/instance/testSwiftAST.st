tests
testSwiftAST
	| test1 test2 |
	test1 := '"Hello, World!"' swiftAST.
	test2 := '1+1' swiftAST.
	" Don't want to be too specific here in case of Swift changes "
	self assert: test1 first equals: $(.
	self assert: test1 last equals: $).
	self assert: test2 first equals: $(.
	self assert: test2 last equals: $)
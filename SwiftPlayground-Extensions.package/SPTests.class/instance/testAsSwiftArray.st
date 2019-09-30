tests
testAsSwiftArray
	self assert: #(1 2 3 4 5) asSwiftArray equals: '[1,2,3,4,5]'.
	self
		assert: #('A' 'B' 'C' 'D' 'E') asSwiftArray
		equals: '["A","B","C","D","E"]'.
	self
		assert: #(1 'A' 2 'B' 3 'C') asSwiftArray
		equals: '[1,"A",2,"B",3,"C"]'
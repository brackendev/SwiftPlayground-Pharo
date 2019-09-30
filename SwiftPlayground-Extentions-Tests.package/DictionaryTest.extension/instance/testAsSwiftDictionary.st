*SwiftPlayground-Extentions-Tests
testAsSwiftDictionary
	self
		assert: (Dictionary newFrom: {('Key' -> 1)}) asSwiftDictionary
		equals: '["Key":1]'.
	self
		assert: (Dictionary newFrom: {('Key' -> 'Value')}) asSwiftDictionary
		equals: '["Key":"Value"]'.
	self
		assert:
			(Dictionary
				newFrom:
					{(1 -> 2). ('A' -> 3). (4 -> 'B'). (5 -> true). (false -> 'C'). ('D' -> 'E')}) asSwiftDictionary
		equals: '[1:2,"A":3,4:"B",5:true,"D":"E",false:"C"]'
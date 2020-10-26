examples
exampleAsSwiftDictionary
	<sampleInstance>
	^ (Dictionary
		newFrom:
			{(1 -> 2).
			('A' -> 3).
			(4 -> 'B').
			(5 -> true).
			(false -> 'C').
			('D' -> 'E')}) asSwiftDictionary
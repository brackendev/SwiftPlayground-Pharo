examples
exampleRunCodeLoop
	<sampleInstance>
	| swiftCode |
	swiftCode := 'var i = 1
repeat {
    print(i)
    i = i + 1
} while i < 11'.
	self new evaluate: swiftCode completion: [ :output | ^ output ]
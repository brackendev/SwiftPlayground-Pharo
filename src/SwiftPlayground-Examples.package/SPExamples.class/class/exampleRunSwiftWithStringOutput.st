examples
exampleRunSwiftWithStringOutput
	<sampleInstance>
	| swiftArray |
	swiftArray := #('A' 'B' 'C' 'D' 'E') asSwiftArray.
	^ (swiftArray , '.joined()') runSwift
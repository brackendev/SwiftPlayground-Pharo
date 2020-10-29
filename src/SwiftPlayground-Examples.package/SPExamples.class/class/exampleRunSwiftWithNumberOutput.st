examples
exampleRunSwiftWithNumberOutput
	<sampleInstance>
	| swiftArray |
	swiftArray := #(1 2 3 4 5) asSwiftArray.
	^ (swiftArray , '.map{$0 * $0}.reduce(0, +)') runSwift asNumber
examples
exampleRunSwiftWithBooleanOutput
	<sampleInstance>
	| swiftString |
	swiftString := 'The five boxing wizards jump quickly' asSwiftString.
	^ ('let (lowercased, alphabet) = (Set(' , swiftString asLowercase
		,
			'), "abcdefghijklmnopqrstuvwxyz")
print("\(!alphabet.contains { !lowercased.contains($0) })")') runSwift
		= 'true'
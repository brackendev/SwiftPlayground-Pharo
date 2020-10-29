"
I am SPExamples, an object to show examples for SwiftPlayground extensions.
"
Class {
	#name : #SPExamples,
	#superclass : #Object,
	#category : 'SwiftPlayground-Examples'
}

{ #category : #examples }
SPExamples class >> exampleAsPharoBoolean [
	<sampleInstance>
	^ '1 == 1' runSwift asPharoBoolean
]

{ #category : #examples }
SPExamples class >> exampleAsSwiftArray [
	<sampleInstance>
	^ #(1 'A' 2 true 3 false) asSwiftArray 
]

{ #category : #examples }
SPExamples class >> exampleAsSwiftBoolean [
	<sampleInstance>
	^ true asSwiftBoolean 
]

{ #category : #examples }
SPExamples class >> exampleAsSwiftDictionary [
	<sampleInstance>
	^ (Dictionary
		newFrom:
			{(1 -> 2).
			('A' -> 3).
			(4 -> 'B').
			(5 -> true).
			(false -> 'C').
			('D' -> 'E')}) asSwiftDictionary
]

{ #category : #examples }
SPExamples class >> exampleAsSwiftString [
	<sampleInstance>
	^ 'Hello, World!' asSwiftString
]

{ #category : #examples }
SPExamples class >> exampleRunSwiftWithBooleanOutput [
	<sampleInstance>
	| swiftString |
	swiftString := 'The five boxing wizards jump quickly' asSwiftString.
	^ ('let (lowercased, alphabet) = (Set(' , swiftString asLowercase
		,
			'), "abcdefghijklmnopqrstuvwxyz")
print("\(!alphabet.contains { !lowercased.contains($0) })")') runSwift
		= 'true'
]

{ #category : #examples }
SPExamples class >> exampleRunSwiftWithNumberOutput [
	<sampleInstance>
	| swiftArray |
	swiftArray := #(1 2 3 4 5) asSwiftArray.
	^ (swiftArray , '.map{$0 * $0}.reduce(0, +)') runSwift asNumber
]

{ #category : #examples }
SPExamples class >> exampleRunSwiftWithStringOutput [
	<sampleInstance>
	| swiftArray |
	swiftArray := #('A' 'B' 'C' 'D' 'E') asSwiftArray.
	^ (swiftArray , '.joined()') runSwift
]

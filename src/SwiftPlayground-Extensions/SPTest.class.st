"
I am SPTests, an object to test SwiftPlayground methods.
"
Class {
	#name : #SPTest,
	#superclass : #TestCase,
	#category : 'SwiftPlayground-Extensions-Tests'
}

{ #category : #tests }
SPTest >> testAsPharoBoolean [
	self assert: 'true' asPharoBoolean equals: true.
	self assert: 'false' asPharoBoolean equals: false.
	self assert: '' asPharoBoolean equals: false.
]

{ #category : #tests }
SPTest >> testAsSwiftArray [
	self assert: #(1 2 3 4 5) asSwiftArray equals: '[1,2,3,4,5]'.
	self
		assert: #('A' 'B' 'C' 'D' 'E') asSwiftArray
		equals: '["A","B","C","D","E"]'.
	self
		assert: #(1 'A' 2 'B' 3 'C') asSwiftArray
		equals: '[1,"A",2,"B",3,"C"]'
]

{ #category : #tests }
SPTest >> testAsSwiftBoolean [
	self assert: false asSwiftBoolean equals: 'false'.
	self assert: true asSwiftBoolean equals: 'true'
]

{ #category : #tests }
SPTest >> testAsSwiftDictionary [
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
					{(1 -> 2).
					('A' -> 3).
					(4 -> 'B').
					(5 -> true).
					(false -> 'C').
					('D' -> 'E')}) asSwiftDictionary
		equals: '[1:2,"A":3,4:"B",5:true,"D":"E",false:"C"]'
]

{ #category : #tests }
SPTest >> testAsSwiftString [
	self assert: 'Hello, World!' asSwiftString equals: '"Hello, World!"'.
	self assert: '1+1' asSwiftString equals: '"1+1"'
]

{ #category : #tests }
SPTest >> testRunSwift [
	self assert: '"Hello, World!"' runSwift equals: 'Hello, World!'.
	self assert: '1+1' runSwift equals: '2'
]

{ #category : #tests }
SPTest >> testSwiftAST [
	| test1 test2 |
	test1 := '"Hello, World!"' swiftAST.
	test2 := '1+1' swiftAST.
	" Don't want to be too specific here in case of Swift changes "
	self assert: test1 first equals: $(.
	self assert: test1 last equals: $).
	self assert: test2 first equals: $(.
	self assert: test2 last equals: $)
]

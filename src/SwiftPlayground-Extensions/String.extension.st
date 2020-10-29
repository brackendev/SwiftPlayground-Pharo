Extension { #name : #String }

{ #category : #'*SwiftPlayground-Extensions' }
String >> asPharoBoolean [
	^ self = 'true'
]

{ #category : #'*SwiftPlayground-Extensions' }
String >> asSwiftString [
	^ '"', self, '"'
]

{ #category : #'*SwiftPlayground-Extensions' }
String >> runSwift [
	SwiftPlayground shared
		evaluate: self
		completion: [ :output | ^ output withoutTrailingNewlines ]
]

{ #category : #'*SwiftPlayground-Extensions' }
String >> swiftAST [
	SwiftPlayground shared
		retrieveASTFor: self
		completion: [ :output | ^ output withoutTrailingNewlines ]
]

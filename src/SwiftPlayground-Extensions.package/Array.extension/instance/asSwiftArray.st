*SwiftPlayground-Extensions
asSwiftArray
	| stream |
	stream := WriteStream on: String new.
	stream nextPutAll: '['.
	self
		doWithIndex:
			[ :each :i | 
			((each isKindOf: Number) or: (each isKindOf: Boolean))
				ifTrue: [ stream nextPutAll: each asString ]
				ifFalse:
					[ stream
						nextPutAll: '"';
						nextPutAll: each asString;
						nextPutAll: '"'
					].
			i = self size
				ifFalse: [ stream nextPutAll: ',' ]
			].
	stream nextPutAll: ']'.
	^ stream contents
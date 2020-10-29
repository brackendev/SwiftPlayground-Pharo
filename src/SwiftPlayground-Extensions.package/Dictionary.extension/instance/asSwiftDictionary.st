*SwiftPlayground-Extensions
asSwiftDictionary
	| stream |
	stream := WriteStream on: String new.
	stream nextPutAll: '['.
	self associations
		doWithIndex:
			[ :each :i | 
			((each key isKindOf: Number) or: (each key isKindOf: Boolean))
				ifTrue:
					[ stream
						nextPutAll: each key asString;
						nextPutAll: ':'
					]
				ifFalse:
					[ stream
						nextPutAll: '"';
						nextPutAll: each key asString;
						nextPutAll: '":'
					].
			((each value isKindOf: Number) or: (each value isKindOf: Boolean))
				ifTrue: [ stream nextPutAll: each value asString ]
				ifFalse:
					[ stream
						nextPutAll: '"';
						nextPutAll: each value asString;
						nextPutAll: '"'
					].
			i = self size
				ifFalse: [ stream nextPutAll: ',' ]
			].
	stream nextPutAll: ']'.
	^ stream contents
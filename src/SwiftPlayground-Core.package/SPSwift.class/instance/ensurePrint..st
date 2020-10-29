private - utilities
ensurePrint: aSwiftCode
	(aSwiftCode includesSubstring: 'print(')
		ifFalse: [ | stream |
			stream := WriteStream on: String new.
			stream
				nextPutAll: 'print(';
				nextPutAll: aSwiftCode;
				nextPutAll: ')'.
			^ stream contents
			].
	^ aSwiftCode
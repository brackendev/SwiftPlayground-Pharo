private - utilities
ensureFoundation: aSwiftCode
	(aSwiftCode includesSubstring: 'import Foundation')
		ifFalse: [ | stream |
			stream := WriteStream on: String new.
			stream
				nextPutAll: 'import Foundation';
				nextPutAll: String crlf;
				nextPutAll: aSwiftCode.
			^ stream contents
			].
	^ aSwiftCode
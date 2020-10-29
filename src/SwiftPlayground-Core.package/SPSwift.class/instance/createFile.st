private - file in/out
createFile
	| file |
	file := self fullFilePath.
	file ensureDelete.
	file
		writeStreamDo: [ :stream | 
			stream
				nextPutAll: (self cleanupCode: content);
				nextPutAll: String crlf
			].
	^ file fullName
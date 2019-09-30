factory
createWith: aSwiftCode
	^ self new
		content: aSwiftCode;
		filename: self randomSwiftFilename;
		yourself
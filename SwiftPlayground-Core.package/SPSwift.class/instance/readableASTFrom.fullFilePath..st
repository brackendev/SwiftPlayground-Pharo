private - utilities
readableASTFrom: anASTString fullFilePath: aFilePathString
	^ anASTString copyReplaceAll: aFilePathString with: 'Swift'.
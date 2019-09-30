helpers
randomSwiftFilename
	^ (Random new next asString copyReplaceAll: '.' with: '') , '.swift'
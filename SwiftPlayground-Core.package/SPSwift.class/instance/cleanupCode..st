private - utilities
cleanupCode: aSwiftCode
	| temp |
	temp := self ensurePrint: aSwiftCode.
	^ self ensureFoundation: temp
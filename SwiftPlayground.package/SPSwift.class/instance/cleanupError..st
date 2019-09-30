private - utilities
cleanupError: anErrorString
	anErrorString trimRight last == $^
		ifTrue: [ ^ '[Swift] ' , anErrorString trimRight allButLast trimRight ]
		ifFalse: [ ^ '[Swift] ' , anErrorString ]
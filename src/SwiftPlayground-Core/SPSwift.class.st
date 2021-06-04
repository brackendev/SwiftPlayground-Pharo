"
I am SPSwift, the object model of a Swift object containing Swift code and a random filename.
"
Class {
	#name : #SPSwift,
	#superclass : #Object,
	#instVars : [
		'content',
		'filename',
		'compileProcess'
	],
	#classInstVars : [
		'shared'
	],
	#category : 'SwiftPlayground-Core'
}

{ #category : #factory }
SPSwift class >> createWith: aSwiftCode [
	^ self new
		content: aSwiftCode;
		filename: self randomSwiftFilename;
		yourself
]

{ #category : #helpers }
SPSwift class >> randomSwiftFilename [
	^ (Random new next asString copyReplaceAll: '.' with: '') , '.swift'
]

{ #category : #'private - utilities' }
SPSwift >> cleanupCode: aSwiftCode [
	| temp |
	temp := self ensurePrint: aSwiftCode.
	^ self ensureFoundation: temp
]

{ #category : #'private - utilities' }
SPSwift >> cleanupError: anErrorString [
	^ anErrorString trimRight last == $^
		ifTrue: [ '[Swift] ' , anErrorString trimRight allButLast trimRight ]
		ifFalse: [ '[Swift] ' , anErrorString ]
]

{ #category : #'private - accessing' }
SPSwift >> compileProcess [
	^ compileProcess
]

{ #category : #'private - accessing' }
SPSwift >> compileProcess: aSwiftCompile [
	compileProcess := aSwiftCompile
]

{ #category : #'private - accessing' }
SPSwift >> content [
	^ content
]

{ #category : #'private - accessing' }
SPSwift >> content: aSwiftCode [
	content := aSwiftCode
]

{ #category : #'private - file in/out' }
SPSwift >> createFile [
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
]

{ #category : #'private - utilities' }
SPSwift >> ensureFoundation: aSwiftCode [
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
]

{ #category : #'private - utilities' }
SPSwift >> ensurePrint: aSwiftCode [
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
]

{ #category : #'private - file in/out' }
SPSwift >> fileCleanup [
	self fullFilePath ensureDelete

	
]

{ #category : #'private - accessing' }
SPSwift >> filename [
	^ filename
]

{ #category : #'private - accessing' }
SPSwift >> filename: aFilenameString [
	filename := aFilenameString
]

{ #category : #'private - file in/out' }
SPSwift >> fullFilePath [
	^ self workingDirectory / filename
]

{ #category : #'private - utilities' }
SPSwift >> readableASTFrom: anASTString fullFilePath: aFilePathString [
	^ anASTString copyReplaceAll: aFilePathString with: 'Swift'.
]

{ #category : #'private - utilities' }
SPSwift >> readableErrorFrom: anErrorString [
	| matcher |
	matcher := RxMatcher forString: '(.*[:]\d*[:]\d*[:]\s.*[:]\s)(.*)'.
	(matcher matches: anErrorString)
		ifTrue:
			[ matcher subexpressionCount > 2
				ifTrue: [ ^ self cleanupError: ((matcher subexpression: 3) capitalized) ]
			].
	^ self cleanupError: anErrorString
]

{ #category : #public }
SPSwift >> retrieveASTWith: aCompletionBlock [
	self
		runUnixCommand: 'swiftc -dump-parse "' , self createFile , '" | cat'
		completion: [ :output :error | 
			output
				ifNotNil: [ aCompletionBlock
						value:
							(self readableASTFrom: output fullFilePath: self fullFilePath pathString)
					].
			error ifNotNil: [ Error signal: error ]
			]
]

{ #category : #public }
SPSwift >> retrieveOutputWith: aCompletionBlock [
	self
		runUnixCommand: 'swift "' , self createFile , '"'
		completion:
			[ :output :error | 
			output ifNotNil: [ aCompletionBlock value: output ].
			error
				ifNotNil: [ "Error signal: (self readableErrorFrom: error)" aCompletionBlock value: error ]
			]
]

{ #category : #'private - utilities' }
SPSwift >> runUnixCommand: aString completion: aCompletionBlock [
	OSSUnixSubprocess new
		shellCommand: aString;
		redirectStdout;
		redirectStderr;
		runAndWaitOnExitDo:
			[ :process :outString :errString | 
			process isSuccess
				ifTrue: [ aCompletionBlock value: outString value: nil ]
				ifFalse: [ aCompletionBlock value: nil value: errString ]
			]
]

{ #category : #'private - file in/out' }
SPSwift >> workingDirectory [
	| dir |
	dir := FileSystem disk workingDirectory / 'SwiftPlayground-tmp'.
	dir createDirectory.
	^ dir
]

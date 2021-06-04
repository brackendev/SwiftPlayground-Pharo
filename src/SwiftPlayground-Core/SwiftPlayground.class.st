"
I am SwiftPlayground, the main object of SwiftPlayground.
"
Class {
	#name : #SwiftPlayground,
	#superclass : #Object,
	#classInstVars : [
		'shared'
	],
	#category : 'SwiftPlayground-Core'
}

{ #category : #examples }
SwiftPlayground class >> exampleOpenPlayground [
	<sampleInstance>
	self openPlayground
]

{ #category : #examples }
SwiftPlayground class >> exampleRunCodeAPIRequest [
	<sampleInstance>
	| swiftCode |
	swiftCode := 'let sessionConfig = URLSessionConfiguration.default
let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
let url = URL(string: "https://en.gravatar.com/5658ffccee7f0ebfda2b226238b1eb6e.json")!

var request = URLRequest(url: url)
request.httpMethod = "GET"

let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
	if let uError = error {
//		fatalError(uError.localizedDescription)
		print(uError.localizedDescription)
	} else if let uData = data, let string = String(data: uData, encoding: String.Encoding.utf8) {
		print(string)
	}
	exit(0)
})

task.resume()
session.finishTasksAndInvalidate()

dispatchMain()'.
	self new evaluate: swiftCode completion: [ :output | ^ output ]
]

{ #category : #examples }
SwiftPlayground class >> exampleRunCodeLoop [
	<sampleInstance>
	| swiftCode |
	swiftCode := 'var i = 1
repeat {
    print(i)
    i = i + 1
} while i < 11'.
	self new evaluate: swiftCode completion: [ :output | ^ output ]
]

{ #category : #'world menu' }
SwiftPlayground class >> menuCommandOn: aBuilder [
	<worldMenu>
	( aBuilder item: 'Swift Playground' )
		help: 'Interact with Swift.' translated;
		parent: #Tools;
		icon: SPResources swiftIcon;
		action: [ self openPlayground ];
		order: 11
]

{ #category : #'instance creation' }
SwiftPlayground class >> new [
	self error: self className , ' is a singleton -- send shared instead'
]

{ #category : #'instance creation' }
SwiftPlayground class >> openPlayground [
	^ self shared
		openWithModel: SPMainComposablePresenterModel new
]

{ #category : #accessing }
SwiftPlayground class >> shared [
	^ shared ifNil: [ shared := super new ]
]

{ #category : #private }
SwiftPlayground >> evaluate: aSwiftCode completion: aCompletionBlock [
	UIManager default
		showWaitCursorWhile: [ | swift |
			swift := SPSwift createWith: aSwiftCode. 
			swift
				retrieveOutputWith: [ :output | aCompletionBlock value: output ]
			]
]

{ #category : #private }
SwiftPlayground >> openWithModel: aMainComposablePresenterModel [
	SPMainComposablePresenter
		openWith: aMainComposablePresenterModel
]

{ #category : #private }
SwiftPlayground >> retrieveASTFor: aSwiftCode completion: aCompletionBlock [
	UIManager default
		showWaitCursorWhile: [ | swift | 
			swift := SPSwift createWith: aSwiftCode.
			swift retrieveASTWith: [ :output | aCompletionBlock value: output ]
			]
]

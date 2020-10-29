"
I am SPMainComposablePresenterModel, the model object for SPMainComposablePresenter.
"
Class {
	#name : #SPMainComposablePresenterModel,
	#superclass : #Model,
	#instVars : [
		'contentProcess',
		'selectedContent'
	],
	#category : 'SwiftPlayground-Core-SwiftPlayground-Core'
}

{ #category : #accessing }
SPMainComposablePresenterModel >> contentProcess [
	^ contentProcess
]

{ #category : #accessing }
SPMainComposablePresenterModel >> contentProcess: aSwiftCompile [
	contentProcess := aSwiftCompile
]

{ #category : #accessing }
SPMainComposablePresenterModel >> selectedContent [
	^ selectedContent
]

{ #category : #accessing }
SPMainComposablePresenterModel >> selectedContent: aSwiftCode [
	selectedContent := aSwiftCode
]

{ #category : #updating }
SPMainComposablePresenterModel >> windowIsClosing [
	contentProcess ifNotNil: [ contentProcess terminate. contentProcess := nil ].
	
]

"
I am SPMainComposablePresenter, the ComposablePresenterWithModel subclass object.
"
Class {
	#name : #SPMainComposablePresenter,
	#superclass : #ComposablePresenterWithModel,
	#instVars : [
		'contentTextPresenter',
		'contentTextModel',
		'contentTextMorph',
		'contentTextAdapter'
	],
	#category : 'SwiftPlayground-Core-SwiftPlayground-Core'
}

{ #category : #specs }
SPMainComposablePresenter class >> defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :column | column newRow: #contentTextAdapter ];
		yourself
]

{ #category : #specs }
SPMainComposablePresenter class >> openWith: aMainComposablePresenterModel [
	| instance |
	instance := self
		on: aMainComposablePresenterModel.
		instance extent: 600 @ 400;
		askOkToClose: true;
		openWithSpec.
	instance window
		whenClosedDo: [ instance announcingObject windowIsClosing ]
]

{ #category : #specs }
SPMainComposablePresenter class >> title [
	^ 'Swift Playground'
]

{ #category : #api }
SPMainComposablePresenter >> aboutText [
	^ 'Swift Playground
	
Interact with Swift.'
]

{ #category : #accessing }
SPMainComposablePresenter >> contentTextAdapter [
	^ contentTextAdapter
]

{ #category : #accessing }
SPMainComposablePresenter >> contentTextAdapter: anObject [
	contentTextAdapter := anObject
]

{ #category : #accessing }
SPMainComposablePresenter >> contentTextModel [
	^ contentTextModel
]

{ #category : #accessing }
SPMainComposablePresenter >> contentTextModel: anObject [
	contentTextModel := anObject
]

{ #category : #accessing }
SPMainComposablePresenter >> contentTextMorph [
	^ contentTextMorph
]

{ #category : #accessing }
SPMainComposablePresenter >> contentTextMorph: anObject [
	contentTextMorph := anObject
]

{ #category : #accessing }
SPMainComposablePresenter >> contentTextPresenter [
	^ contentTextPresenter
]

{ #category : #accessing }
SPMainComposablePresenter >> contentTextPresenter: anObject [
	contentTextPresenter := anObject
]

{ #category : #initialization }
SPMainComposablePresenter >> initializeWidgets [
	"contentTextPresenter := self instantiate: PSContentTextPresenter"

	contentTextModel := SPContentTextModel new setupWith: self.
	contentTextMorph := RubScrolledTextMorph new
		model: contentTextModel;
		"getSelectionSelector: #primarySelectionInterval;"
			withLineNumbers;
		beWrapped;
		beForPlainText;
		textFont: StandardFonts codeFont;
		autoAccept: true;
		textColor: Color white;
		yourself.
	contentTextMorph
		selectFrom: 1
		to: contentTextMorph textArea text size.
	contentTextMorph
		on: $i command
		do: [ contentTextModel inspectIt ].
	contentTextMorph
		on: $d command
		do: [ contentTextModel doIt ].
	contentTextAdapter := contentTextMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		asSpecAdapter
]

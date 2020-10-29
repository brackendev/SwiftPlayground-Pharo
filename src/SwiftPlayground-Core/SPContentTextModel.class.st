"
I am SPContentTextModel, the model object for PSContentTextMorph.
"
Class {
	#name : #SPContentTextModel,
	#superclass : #RubScrolledTextModel,
	#instVars : [
		'owner'
	],
	#category : 'SwiftPlayground-Core-SwiftPlayground-Core'
}

{ #category : #menu }
SPContentTextModel class >> menuOn: aBuilder [
	<SPContentTextPresenterContextMenu>
	( aBuilder item: #'Do it' translated )
		keyText: 'd';
		selector: #doIt;
		iconName: #smallDoItIcon.

" TODO "
	"( aBuilder item: #'Print it' translated )
		keyText: 'p';
		selector: #printIt;
		iconName: #smallPrintItIcon."

	( aBuilder item: #'Inspect it' translated )
		keyText: 'i';
		selector: #inspectIt;
		iconName: #smallInspectItIcon;
		withSeparatorAfter.

	( aBuilder item: #'Inspect AST' translated )
		selector: #inspectAST;
		iconName: #smallObjects;
		withSeparatorAfter.

	( aBuilder item: #'Find...' translated )
		keyText: 'f';
		selector: #find;
		iconName: #smallFindIcon.
	( aBuilder item: #'Find again' translated )
		keyText: 'g';
		selector: #findAgain;
		iconName: #smallFindIcon.
	( aBuilder item: #'Set search string' translated )
		keyText: 'h';
		selector: #setSearchString;
		withSeparatorAfter.

	( aBuilder item: #Undo translated )
		keyText: 'z';
		selector: #undo;
		iconName: #smallUndoIcon;
		withSeparatorAfter.

	( aBuilder item: #Copy translated )
		keyText: 'c';
		selector: #copySelection;
		iconName: #smallCopyIcon.

	( aBuilder item: #Cut translated )
		keyText: 'x';
		selector: #cut;
		iconName: #smallCutIcon.

	( aBuilder item: #Paste translated )
		keyText: 'v';
		selector: #paste;
		iconName: #smallPasteIcon.

	( aBuilder item: #'Paste...' translated )
		selector: #pasteRecent;
		iconName: #smallPasteIcon;
		withSeparatorAfter
]

{ #category : #setup }
SPContentTextModel >> createMenu: aMenu [
	"^ (PragmaMenuBuilder
		pragmaKeyword: #SPContentTextPresenterContextMenu
		model: self) menu"
]

{ #category : #'do-its' }
SPContentTextModel >> doIt [
	self evaluateCodeWith: [ :output | ]
]

{ #category : #'do-its' }
SPContentTextModel >> evaluateCodeWith: aCompletionBlock [
	SwiftPlayground shared
		evaluate: self retrieveSelection
		completion: [ :output | aCompletionBlock value: output ]
]

{ #category : #'do-its' }
SPContentTextModel >> inspectAST [
	SwiftPlayground shared
		retrieveASTFor: self retrieveSelection
		completion: [ :output | output inspect ]
]

{ #category : #'do-its' }
SPContentTextModel >> inspectIt [
	self evaluateCodeWith: [ :output | output inspect ]
]

{ #category : #setup }
SPContentTextModel >> menu [
	^ (PragmaMenuBuilder
		pragmaKeyword: #SPContentTextPresenterContextMenu
		model: self) menu
]

{ #category : #accessing }
SPContentTextModel >> owner [
	^ owner
]

{ #category : #accessing }
SPContentTextModel >> owner: anObject [
	owner := anObject
]

{ #category : #'do-its' }
SPContentTextModel >> printIt [
	"TODO"

	| selection code |
	selection := self owner contentTextMorph selectionInterval.
	code := selection
		ifEmpty: [ self text ]
		ifNotEmpty: [ self text
				copyFrom: (selection at: 1)
				to: (selection at: selection size)
			].
	SwiftPlayground shared
		evaluate: code asString
		completion: [ :output | "self afterSelectionInsertAndSelect: output" ]
]

{ #category : #'do-its' }
SPContentTextModel >> retrieveSelection [
	| selection code |
	selection := self owner contentTextMorph selectionInterval.
	code := selection
		ifEmpty: [ self text ]
		ifNotEmpty: [ self text
				copyFrom: (selection at: 1)
				to: (selection at: selection size)
			].
	^ code asString
]

{ #category : #setup }
SPContentTextModel >> setupWith: anOwner [
	owner := anOwner.
	self setInitialText: '"Hello, World!"'
]

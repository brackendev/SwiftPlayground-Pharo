initialization
initializeWidgets
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
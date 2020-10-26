do-its
printIt
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
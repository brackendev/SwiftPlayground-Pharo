do-its
retrieveSelection
	| selection code |

	selection := self owner contentTextMorph selectionInterval.
	code := selection
		ifEmpty: [ self text ]
		ifNotEmpty: [ self text copyFrom: ( selection at: 1 ) to: ( selection at: selection size ) ].
		
	^ code asString
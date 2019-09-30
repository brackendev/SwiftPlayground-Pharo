updating
windowIsClosing
	contentProcess ifNotNil: [ contentProcess terminate. contentProcess := nil ].
	
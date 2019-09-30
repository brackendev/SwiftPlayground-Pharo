specs
openWith: aMainComposablePresenterModel
	| instance |
	instance := self
		on: aMainComposablePresenterModel.
		instance extent: 600 @ 400;
		askOkToClose: true;
		openWithSpec.
	instance window
		whenClosedDo: [ instance announcingObject windowIsClosing ]
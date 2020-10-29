accessing
shared
	^ shared ifNil: [ shared := super new ]
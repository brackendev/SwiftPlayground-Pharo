tests
testAsPharoBoolean
	self assert: 'true' asPharoBoolean equals: true.
	self assert: 'false' asPharoBoolean equals: false.
	self assert: '' asPharoBoolean equals: false.
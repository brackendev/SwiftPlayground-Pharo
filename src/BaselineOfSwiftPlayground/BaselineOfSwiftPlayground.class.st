"
BaselineOfSwiftPlayground is the BaselineOf subclass for SwiftPlayground.
"
Class {
	#name : #BaselineOfSwiftPlayground,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSwiftPlayground'
}

{ #category : #baselines }
BaselineOfSwiftPlayground >> baseline: spec [
	<baseline>
	spec
		for: #common
		do:
			[ self setupDependencies: spec.
			spec
				package: 'SwiftPlayground-Core'
				with: [ spec requires: #('OSSubprocess') ].
			spec
				package: 'SwiftPlayground-Examples'
				with: [ spec requires: #('SwiftPlayground-Core') ].
			spec
				package: 'SwiftPlayground-Extensions'
				with: [ spec requires: #('SwiftPlayground-Core') ]
				]
]

{ #category : #baselines }
BaselineOfSwiftPlayground >> setupDependencies: spec [
	spec
		baseline: 'OSSubprocess'
		with: [ spec repository: 'github://pharo-contributions/OSSubprocess:v1.2.2/repository' ]
]

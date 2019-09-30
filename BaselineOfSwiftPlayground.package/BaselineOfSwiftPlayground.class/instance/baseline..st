baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do:
			[ self setUpDependencies: spec.
			spec
				package: 'SwiftPlayground'.
			spec
				package: 'SwiftPlayground-Core'
				with: [ spec requires: #('OSSubprocess') ].
			spec
				package: 'SwiftPlayground-Examples'
				with: [ spec requires: #('SwiftPlayground-Core') ].
			spec
				package: 'SwiftPlayground-Extensions'
				with: [ spec requires: #('SwiftPlayground-Core') ].
			spec
				package: 'SwiftPlayground-Extensions-Tests'
				with: [ spec requires: #('SwiftPlayground-Extensions') ]
			]
baselines
setupPackages: spec
	spec
		for: #common
		do:
			[ self setUpDependencies: spec.
			spec
				package: 'SwiftPlayground'
				with: [ spec requires: #('OSSubprocess') ].
			spec
				package: 'SwiftPlayground-Examples'
				with: [ spec requires: #('SwiftPlayground') ].
			spec
				package: 'SwiftPlayground-Extensions'
				with: [ spec requires: #('SwiftPlayground') ].
			spec
				package: 'SwiftPlayground-Extensions-Tests'
				with: [ spec requires: #('SwiftPlayground-Extensions') ]
			]
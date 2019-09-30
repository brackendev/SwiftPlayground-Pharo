baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do:
			[ spec
						baseline: 'OSSubprocess'
						with:
							[ spec
								repository: 'github://pharo-contributions/OSSubprocess:v1.1/repository'
							].spec
				baseline: 'SwiftPlayground'
				with:
					[ spec
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
			]
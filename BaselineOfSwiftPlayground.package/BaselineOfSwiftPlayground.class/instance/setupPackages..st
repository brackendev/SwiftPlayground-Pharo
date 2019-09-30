baselines
setupPackages: spec
spec
		baseline: 'SwiftPlayground' with: [
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
		with: [ spec requires: #('SwiftPlayground-Extensions') ]]
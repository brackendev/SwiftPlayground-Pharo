baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do:
			[ self
				setupDependencies: spec;
				setupPackages: spec
			]
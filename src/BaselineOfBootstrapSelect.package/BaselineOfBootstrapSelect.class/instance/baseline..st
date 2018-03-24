baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Bootstrap-Select-Core'
				with: [ spec repository: 'github://eMaringolo/seaside-bootstrap-select/src' ].
			spec
				package: 'Bootstrap-Select-Examples'
				with: [ spec
						repository: 'github://eMaringolo/seaside-bootstrap-select/src';
						requires: #('Bootstrap-Select-Core') ].
			spec
				group: 'default' with: #('Bootstrap-Select-Core' 'Bootstrap-Select-Examples');
				group: 'core' with: #('Bootstrap-Select-Core');
				yourself ]
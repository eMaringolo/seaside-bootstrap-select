Class {
	#name : #BaselineOfBootstrapSelect,
	#superclass : #BaselineOf,
	#category : #BaselineOfBootstrapSelect
}

{ #category : #baselines }
BaselineOfBootstrapSelect >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Bootstrap4'
				with: [ spec repository: 'github://astares/Seaside-Bootstrap4:master/src' ].
			spec
				package: 'Bootstrap-Select-Core'
				with: [ spec requires: 'Bootstrap4' ].
			spec
				package: 'Bootstrap-Select-Examples'
				with: [ spec requires: #('Bootstrap-Select-Core') ].
			spec
				group: 'default'
					with: #('Bootstrap-Select-Core' 'Bootstrap-Select-Examples');
				group: 'core' with: #('Bootstrap-Select-Core');
				yourself ]
]

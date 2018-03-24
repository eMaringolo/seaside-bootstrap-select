rendering
renderBasicExamplesOn: html
	html heading: 'Basic examples'.
	self basicExamples
		keysAndValuesDo: [ :title :selector | self renderExample: title selector: selector on: html ]
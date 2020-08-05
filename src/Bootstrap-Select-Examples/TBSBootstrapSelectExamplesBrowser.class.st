Class {
	#name : #TBSBootstrapSelectExamplesBrowser,
	#superclass : #WAComponent,
	#category : #'Bootstrap-Select-Examples'
}

{ #category : #testing }
TBSBootstrapSelectExamplesBrowser class >> canBeRoot [

	^true
]

{ #category : #testing }
TBSBootstrapSelectExamplesBrowser class >> handlerName [

	^'bootstrap-select'
]

{ #category : #testing }
TBSBootstrapSelectExamplesBrowser class >> initialize [

	self register
]

{ #category : #testing }
TBSBootstrapSelectExamplesBrowser class >> register [

	|app|
	app := WAAdmin register: self asApplicationAt: self handlerName.
	app 
		addLibrary: JQDeploymentLibrary;
		addLibrary: TBSSelectDevelopmentLibrary
]

{ #category : #'accessing-samples' }
TBSBootstrapSelectExamplesBrowser >> basicExamples [

	^GRSmallDictionary new 
		add: 'Standard select boxes' -> #renderStandardSelectBoxesOn:;
		add: 'Select boxes with Option groups' -> #renderSelectBoxesWithOptgroupsOn:;
		add: 'Multiple select picker' -> #renderMultipleSelectPickerOn:;
		yourself
]

{ #category : #'accessing-samples' }
TBSBootstrapSelectExamplesBrowser >> dressings [
	^ {'Mustard' . 'Ketchup' . 'Relish'}
]

{ #category : #'accessing-samples' }
TBSBootstrapSelectExamplesBrowser >> gear [
	^ {'Tent' . 'Flashlight' . 'Toilet paper'}
]

{ #category : #rendering }
TBSBootstrapSelectExamplesBrowser >> renderBasicExamplesOn: html [
	html heading: 'Basic examples'.
	self basicExamples
		keysAndValuesDo: [ :title :selector | self renderExample: title selector: selector on: html ]
]

{ #category : #rendering }
TBSBootstrapSelectExamplesBrowser >> renderContentOn: html [
	html
		tbsJumbotron: [ html tbsContainer: [ html heading with: 'Bootstrap Select' ] ].
	html
		tbsContainerFluid: [
			html tbsColumn
				mediumSize: 3;
				with: [ self renderExamplesSideNavOn: html ].
			html tbsColumn
				mediumSize: 9;
				with: [ self renderExamplesOn: html ] ]
]

{ #category : #'rendering-support' }
TBSBootstrapSelectExamplesBrowser >> renderExample: title selector: aSymbol on: html [
	html
		tbsPanel
		beDefault;
		with: [ html
				tbsPanelHeading: [ html heading
						level3;
						id: aSymbol asString;
						with: title ].
			html tbsPanelBody: [ self perform: aSymbol with: html ].
			html
				tbsPanelFooter: [ html code: [ html preformatted: (self class methodNamed: aSymbol) sourceCode ] ] ]
]

{ #category : #rendering }
TBSBootstrapSelectExamplesBrowser >> renderExamplesOn: html [
	^ self renderBasicExamplesOn: html
]

{ #category : #rendering }
TBSBootstrapSelectExamplesBrowser >> renderExamplesSideNavOn: html [
	html tbsNav
		beStacked;
		with: [ self basicExamples
				keysAndValuesDo: [ :title :selector | 
					html
						tbsNavItem: [ html anchor
								url: '#' , selector asString;
								with: title ] ] ]
]

{ #category : #'rendering-basic' }
TBSBootstrapSelectExamplesBrowser >> renderMultipleSelectPickerOn: html [

	self tip: 'Seaside requires a special tag to handle multiselection' on: html.
	html tbsMultiSelect
		list: self dressings.

]

{ #category : #'rendering-basic' }
TBSBootstrapSelectExamplesBrowser >> renderSelectBoxesWithOptgroupsOn: html [
	| groups |
	groups := {('Picnic' -> self dressings).
	('Camping' -> self gear)} asDictionary.
	self tip: 'If you pass a Dictionary-like object it will use keys as the labels for the optgroups and values as the items of each group' on: html.
	html tbsSelect list: groups
]

{ #category : #'rendering-basic' }
TBSBootstrapSelectExamplesBrowser >> renderStandardSelectBoxesOn: html [

	html paragraph: 'Make this:'.
	html select list: self dressings.
	
	html paragraph: 'Become this:'.
	html tbsSelect list: self dressings.

]

{ #category : #'accessing-samples' }
TBSBootstrapSelectExamplesBrowser >> styleExamples [

	^GRSmallDictionary new 
		add: 'Button classes' -> #renderButtonClassesOn:;
		yourself
]

{ #category : #'rendering-support' }
TBSBootstrapSelectExamplesBrowser >> tip: aString on: html [
	html tbsAlert
		beInfo;
		with: [ html heading
				level3;
				with: 'Tip'.
			html paragraph: aString ]
]

{ #category : #rendering }
TBSBootstrapSelectExamplesBrowser >> updateRoot: htmlRoot [

	htmlRoot title: 'Bootstrap Select'
]

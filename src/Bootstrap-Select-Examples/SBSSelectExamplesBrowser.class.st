Class {
	#name : #SBSSelectExamplesBrowser,
	#superclass : #SBSComponent,
	#category : #'Bootstrap-Select-Examples'
}

{ #category : #testing }
SBSSelectExamplesBrowser class >> canBeRoot [

	^true
]

{ #category : #testing }
SBSSelectExamplesBrowser class >> handlerName [

	^'bootstrap-select'
]

{ #category : #testing }
SBSSelectExamplesBrowser class >> initialize [

	self register
]

{ #category : #testing }
SBSSelectExamplesBrowser class >> register [
	<script>
	| app |
	app := WAAdmin register: self asApplicationAt: self handlerName.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: SBSDevelopmentLibrary;
		addLibrary: SBSSelectDevelopmentLibrary
]

{ #category : #'accessing-samples' }
SBSSelectExamplesBrowser >> basicExamples [

	^GRSmallDictionary new 
		add: 'Standard select boxes' -> #renderStandardSelectBoxesOn:;
		add: 'Select boxes with Option groups' -> #renderSelectBoxesWithOptgroupsOn:;
		add: 'Multiple select picker' -> #renderMultipleSelectPickerOn:;
		add: 'Multiple with action box' -> #renderMultipleSelectActionBoxPickerOn:;
		yourself
]

{ #category : #'accessing-samples' }
SBSSelectExamplesBrowser >> dressings [
	^ {'Mustard' . 'Ketchup' . 'Relish'}
]

{ #category : #'accessing-samples' }
SBSSelectExamplesBrowser >> gear [
	^ {'Tent' . 'Flashlight' . 'Toilet paper'}
]

{ #category : #rendering }
SBSSelectExamplesBrowser >> renderBasicExamplesOn: html [
	html heading: 'Basic examples'.
	self basicExamples
		keysAndValuesDo: [ :title :selector | self renderExample: title selector: selector on: html. html horizontalRule ]
]

{ #category : #rendering }
SBSSelectExamplesBrowser >> renderContentOn: html [
	html
		jumbotron: [ html container: [ html heading with: 'Bootstrap Select' ] ].
	html container
		with: [ html
				row: [ html column
						mediumSize: 3;
						with: [ self renderExamplesSideNavOn: html ].
					html column
						mediumSize: 9;
						with: [ self renderExamplesOn: html ] ] ]
]

{ #category : #'rendering-support' }
SBSSelectExamplesBrowser >> renderExample: title selector: aSymbol on: html [
	html card
		with: [ html
				cardHeader: [ html span
						id: aSymbol asString;
						with: title ].
			html cardBody: [ self perform: aSymbol with: html ].
			html
				cardFooter: [ html
						code: [ html preformatted: (self class methodNamed: aSymbol) sourceCode ] ] ]
]

{ #category : #rendering }
SBSSelectExamplesBrowser >> renderExamplesOn: html [
	^ self renderBasicExamplesOn: html
]

{ #category : #rendering }
SBSSelectExamplesBrowser >> renderExamplesSideNavOn: html [
	html navigation
		flexColumn;
		with: [ self basicExamples
				keysAndValuesDo: [ :title :selector | 
					html navigationLink
						url: '#' , selector asString;
						with: title ] ]
]

{ #category : #'rendering-basic' }
SBSSelectExamplesBrowser >> renderMultipleSelectActionBoxPickerOn: html [

	html sbsMultiSelect
		showActionBox;
		list: self dressings
]

{ #category : #'rendering-basic' }
SBSSelectExamplesBrowser >> renderMultipleSelectPickerOn: html [
	self
		tip: 'Seaside requires a special tag to handle multiselection'
		on: html.
	html sbsMultiSelect
		maxOptions: 2;
		list: self dressings.
	html heading
		level4;
		with: 'With Action box'.
	html sbsMultiSelect
		showActionBox;
		list: self dressings
]

{ #category : #'rendering-basic' }
SBSSelectExamplesBrowser >> renderSelectBoxesWithOptgroupsOn: html [
	| groups |
	groups := {('Picnic' -> self dressings).
	('Camping' -> self gear)} asDictionary.
	self tip: 'If you pass a Dictionary-like object it will use keys as the labels for the optgroups and values as the items of each group' on: html.
	html sbsSelect list: groups
]

{ #category : #'rendering-basic' }
SBSSelectExamplesBrowser >> renderStandardSelectBoxesOn: html [

	html paragraph: 'Make this:'.
	html select list: self dressings.
	
	html paragraph: 'Become this:'.
	html sbsSelect list: self dressings.

]

{ #category : #'accessing-samples' }
SBSSelectExamplesBrowser >> styleExamples [

	^GRSmallDictionary new 
		add: 'Button classes' -> #renderButtonClassesOn:;
		yourself
]

{ #category : #'rendering-support' }
SBSSelectExamplesBrowser >> tip: aString on: html [
	html alert
		beInfo;
		with: [ html heading
				level3;
				with: 'Tip'.
			html paragraph: aString ]
]

{ #category : #rendering }
SBSSelectExamplesBrowser >> updateRoot: htmlRoot [

	super updateRoot: htmlRoot.
	htmlRoot title: 'Bootstrap Select'
]

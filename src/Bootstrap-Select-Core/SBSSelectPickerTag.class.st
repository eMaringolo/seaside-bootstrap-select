Class {
	#name : #SBSSelectPickerTag,
	#superclass : #WASelectTag,
	#instVars : [
		'classBlock',
		'styleBlock',
		'autoinitialize',
		'subtextsBlock',
		'options',
		'usesGroups',
		'groupsBlock'
	],
	#category : #'Bootstrap-Select-Core'
}

{ #category : #private }
SBSSelectPickerTag >> after [
	
	self autoinitialize ifTrue: [self initializationScriptUsing: canvas]
]

{ #category : #accessing }
SBSSelectPickerTag >> autoinitialize [
	
	^autoinitialize
]

{ #category : #accessing }
SBSSelectPickerTag >> autoinitialize: anObject [
	
	autoinitialize := anObject
]

{ #category : #configuration }
SBSSelectPickerTag >> beExtraSmall [
	"Configures receiver to use extra small buttons."
	
	self optionAt: 'styleBase' put: 'btn btn-xs'
]

{ #category : #configuration }
SBSSelectPickerTag >> beLarge [
	"Configures receiver to use large buttons."
	
	self optionAt: 'styleBase' put: 'btn btn-lg'
]

{ #category : #configuration }
SBSSelectPickerTag >> beSmall [
	"Configures receiver to use small buttons."
	
	self optionAt: 'styleBase' put: 'btn btn-sm'
]

{ #category : #private }
SBSSelectPickerTag >> before [
	
	self isOptional ifTrue: [self renderOptional].
	self hasList
		ifTrue:
			[self hasGroups
				ifTrue:
					[self list
						keysAndValuesDo:
							[:group :items | self usesGroups ifTrue: [self renderGroup: group items: items]]]
				ifFalse: [self renderListItems: self list]]
]

{ #category : #private }
SBSSelectPickerTag >> classFor: anObject [
	
	^classBlock isNil
		ifTrue: [anObject]
		ifFalse: [classBlock value: anObject]
]

{ #category : #accessing }
SBSSelectPickerTag >> classes: aBlock [
	
	classBlock := aBlock
]

{ #category : #private }
SBSSelectPickerTag >> container: anObject [ 
	
	self optionAt: 'container' put: anObject
]

{ #category : #accessing }
SBSSelectPickerTag >> groups: aBlock [
	
	groupsBlock := aBlock
]

{ #category : #configuration }
SBSSelectPickerTag >> hasGroups [
	"Note: we test for #isSequenceable, because GRSmallDictionary returns false to #isDictionary."
	
	^self list isSequenceable not
]

{ #category : #testing }
SBSSelectPickerTag >> hasList [
	
	^list notNil and: [list isEmpty not]
]

{ #category : #attributes }
SBSSelectPickerTag >> header: aString [
	
	self dataAt: 'header' put: aString
]

{ #category : #initialization }
SBSSelectPickerTag >> initializationScriptOn: aCanvas [

	^ (aCanvas jQuery id: (attributes at: 'id'))
		  call: 'selectpicker'
		  with: options
]

{ #category : #initialization }
SBSSelectPickerTag >> initializationScriptUsing: aCanvas [

	aCanvas document scriptGenerator addLoadScript:
		(self initializationScriptOn: aCanvas)
]

{ #category : #'initialize-release' }
SBSSelectPickerTag >> initialize [
	
	super initialize.
	autoinitialize := true.
	options := GRSmallDictionary new
]

{ #category : #initializing }
SBSSelectPickerTag >> initializeOptions [
	
	options := GRSmallDictionary new
]

{ #category : #private }
SBSSelectPickerTag >> labelForGroup: group [
	
	^groupsBlock value: group
]

{ #category : #accessing }
SBSSelectPickerTag >> list: aCollection [
	"Append aCollection of items to display. The rendering can be customized using #labels:."
	
	list isNil
		ifTrue: [list := aCollection]
		ifFalse: [self addAll: aCollection]
]

{ #category : #options }
SBSSelectPickerTag >> optionAt: aKey [
	
	^self options
		at: aKey
		ifAbsent: [nil]
]

{ #category : #options }
SBSSelectPickerTag >> optionAt: aKey put: aValue [
	
	^self options
		at: aKey asString
		put: aValue
]

{ #category : #private }
SBSSelectPickerTag >> options [
	
	^options ifNil: [self initializeOptions]
]

{ #category : #private }
SBSSelectPickerTag >> renderGroup: group items: items [
	
	(canvas optionGroup)
		label:
				(groupsBlock isNil
						ifTrue: [group]
						ifFalse: [self labelForGroup: group]);
		with: [self renderListItems: items]
]

{ #category : #'rendering-private' }
SBSSelectPickerTag >> renderListItem: anObject labelled: aString [
	
	| option |
	option := canvas option.
	self hasCallback ifTrue: [option value: (self valueFor: anObject)].
	titleBlock isNil ifFalse: [option title: (self titleFor: anObject)].
	classBlock isNil ifFalse: [option class: (self classFor: anObject)].
	styleBlock isNil
		ifFalse:
			[option
				attributeAt: 'data-style'
				put: (self styleFor: anObject)].
	subtextsBlock isNil
		ifFalse:
			[option
				attributeAt: 'data-subtext'
				put: (self subtextFor: anObject)].
	option
		selected: (self isSelected: anObject);
		disabled: (self isEnabled: anObject) not;
		with: aString
]

{ #category : #'rendering-private' }
SBSSelectPickerTag >> renderListItems: items [
	
	items
		do:
			[:each | 
			self
				renderListItem: each
				labelled: (self labelForOption: each)]
]

{ #category : #initialization }
SBSSelectPickerTag >> scriptInitializationOn: aCanvas [

	aCanvas << (self initializationScriptOn: aCanvas)
]

{ #category : #configuration }
SBSSelectPickerTag >> selectOnTab [
	
	self optionAt: 'selectOnTab' put: 'true'
]

{ #category : #configuration }
SBSSelectPickerTag >> showGroups [
	
	usesGroups := true
]

{ #category : #configuration }
SBSSelectPickerTag >> showSubtext [
	
	self attributeAt: 'data-show-subtext' put: true
]

{ #category : #configuration }
SBSSelectPickerTag >> showTick [
	
	self class: 'show-tick'
]

{ #category : #private }
SBSSelectPickerTag >> styleFor: anObject [
	
	^styleBlock isNil
		ifTrue: [anObject]
		ifFalse: [styleBlock value: anObject]
]

{ #category : #accessing }
SBSSelectPickerTag >> styles: aBlock [
	
	styleBlock := aBlock
]

{ #category : #private }
SBSSelectPickerTag >> subtextFor: anObject [
	
	^subtextsBlock isNil
		ifTrue: [anObject asString]
		ifFalse: [subtextsBlock value: anObject]
]

{ #category : #accessing }
SBSSelectPickerTag >> subtexts: aBlock [
	
	subtextsBlock := aBlock
]

{ #category : #options }
SBSSelectPickerTag >> usesGroups [
	
	^usesGroups ifNil: [usesGroups := self hasGroups]
]

{ #category : #'accessing-attributes' }
SBSSelectPickerTag >> width: aString [
	
	self dataAt: 'width' put: aString
]

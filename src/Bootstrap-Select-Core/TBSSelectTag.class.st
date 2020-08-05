Class {
	#name : #TBSSelectTag,
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
TBSSelectTag >> after [
	
	self autoinitialize ifTrue: [self initializationScriptUsing: canvas]
]

{ #category : #accessing }
TBSSelectTag >> autoinitialize [
	
	^autoinitialize
]

{ #category : #accessing }
TBSSelectTag >> autoinitialize: anObject [
	
	autoinitialize := anObject
]

{ #category : #configuration }
TBSSelectTag >> beExtraSmall [
	"Configures receiver to use extra small buttons."
	
	self optionAt: 'styleBase' put: 'btn btn-xs'
]

{ #category : #configuration }
TBSSelectTag >> beLarge [
	"Configures receiver to use large buttons."
	
	self optionAt: 'styleBase' put: 'btn btn-lg'
]

{ #category : #configuration }
TBSSelectTag >> beSmall [
	"Configures receiver to use small buttons."
	
	self optionAt: 'styleBase' put: 'btn btn-sm'
]

{ #category : #private }
TBSSelectTag >> before [
	
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
TBSSelectTag >> classFor: anObject [
	
	^classBlock isNil
		ifTrue: [anObject]
		ifFalse: [classBlock value: anObject]
]

{ #category : #accessing }
TBSSelectTag >> classes: aBlock [
	
	classBlock := aBlock
]

{ #category : #accessing }
TBSSelectTag >> groups: aBlock [
	
	groupsBlock := aBlock
]

{ #category : #configuration }
TBSSelectTag >> hasGroups [
	"Note: we test for #isSequenceable, because GRSmallDictionary returns false to #isDictionary."
	
	^self list isSequenceable not
]

{ #category : #testing }
TBSSelectTag >> hasList [
	
	^list notNil and: [list isEmpty not]
]

{ #category : #attributes }
TBSSelectTag >> header: aString [
	
	self dataAt: 'header' put: aString
]

{ #category : #initialization }
TBSSelectTag >> initializationScriptUsing: aCanvas [
	
	aCanvas
		script:
			(String
				streamContents:
					[:s | 
					s
						nextPutAll: '$("#';
						nextPutAll: (attributes at: 'id');
						nextPutAll: '").selectpicker('.
					self options isEmpty ifFalse: [self options javascriptOn: s].
					s nextPutAll: ');'])
]

{ #category : #'initialize-release' }
TBSSelectTag >> initialize [
	
	super initialize.
	autoinitialize := true.
	options := GRSmallDictionary new
]

{ #category : #initializing }
TBSSelectTag >> initializeOptions [
	
	options := GRSmallDictionary new
]

{ #category : #private }
TBSSelectTag >> labelForGroup: group [
	
	^groupsBlock value: group
]

{ #category : #accessing }
TBSSelectTag >> list: aCollection [
	"Append aCollection of items to display. The rendering can be customized using #labels:."
	
	list isNil
		ifTrue: [list := aCollection]
		ifFalse: [self addAll: aCollection]
]

{ #category : #options }
TBSSelectTag >> optionAt: aKey [
	
	^self options
		at: aKey
		ifAbsent: [nil]
]

{ #category : #options }
TBSSelectTag >> optionAt: aKey put: aValue [
	
	^self options
		at: aKey asString
		put: aValue
]

{ #category : #private }
TBSSelectTag >> options [
	
	^options ifNil: [self initializeOptions]
]

{ #category : #private }
TBSSelectTag >> renderGroup: group items: items [
	
	(canvas optionGroup)
		label:
				(groupsBlock isNil
						ifTrue: [group]
						ifFalse: [self labelForGroup: group]);
		with: [self renderListItems: items]
]

{ #category : #'rendering-private' }
TBSSelectTag >> renderListItem: anObject labelled: aString [
	
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
TBSSelectTag >> renderListItems: items [
	
	items
		do:
			[:each | 
			self
				renderListItem: each
				labelled: (self labelForOption: each)]
]

{ #category : #configuration }
TBSSelectTag >> selectOnTab [
	
	self optionAt: 'selectOnTab' put: 'true'
]

{ #category : #configuration }
TBSSelectTag >> showGroups [
	
	usesGroups := true
]

{ #category : #configuration }
TBSSelectTag >> showSubtext [
	
	self attributeAt: 'data-show-subtext' put: true
]

{ #category : #configuration }
TBSSelectTag >> showTick [
	
	self class: 'show-tick'
]

{ #category : #private }
TBSSelectTag >> styleFor: anObject [
	
	^styleBlock isNil
		ifTrue: [anObject]
		ifFalse: [styleBlock value: anObject]
]

{ #category : #accessing }
TBSSelectTag >> styles: aBlock [
	
	styleBlock := aBlock
]

{ #category : #private }
TBSSelectTag >> subtextFor: anObject [
	
	^subtextsBlock isNil
		ifTrue: [anObject asString]
		ifFalse: [subtextsBlock value: anObject]
]

{ #category : #accessing }
TBSSelectTag >> subtexts: aBlock [
	
	subtextsBlock := aBlock
]

{ #category : #options }
TBSSelectTag >> usesGroups [
	
	^usesGroups ifNil: [usesGroups := self hasGroups]
]

{ #category : #'accessing-attributes' }
TBSSelectTag >> width: aString [
	
	self dataAt: 'width' put: aString
]

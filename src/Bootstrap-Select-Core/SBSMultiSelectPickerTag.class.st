Class {
	#name : #SBSMultiSelectPickerTag,
	#superclass : #WAMultiSelectTag,
	#instVars : [
		'autoinitialize',
		'options'
	],
	#category : #'Bootstrap-Select-Core'
}

{ #category : #private }
SBSMultiSelectPickerTag >> after [
	
	self autoinitialize ifTrue: [self initializationScriptUsing: canvas]
]

{ #category : #accessing }
SBSMultiSelectPickerTag >> autoinitialize [
	
	^autoinitialize
]

{ #category : #accessing }
SBSMultiSelectPickerTag >> autoinitialize: anObject [
	
	autoinitialize := anObject
]

{ #category : #'initialize-release' }
SBSMultiSelectPickerTag >> container: anObject [ 
	
	self optionAt: 'container' put: anObject
]

{ #category : #initialization }
SBSMultiSelectPickerTag >> initializationScriptUsing: aCanvas [
	aCanvas document scriptGenerator
		addLoadScript:
			(String
				streamContents: [ :s | 
					s
						nextPutAll: '$("#';
						nextPutAll: (attributes at: 'id');
						nextPutAll: '").selectpicker('.
					self options isEmpty
						ifFalse: [ self options javascriptOn: s ].
					s nextPutAll: ');' ])
]

{ #category : #'initialize-release' }
SBSMultiSelectPickerTag >> initialize [
	super initialize.
	autoinitialize := true.
	self initializeOptions
]

{ #category : #'initialize-release' }
SBSMultiSelectPickerTag >> initializeOptions [

	options := GRSmallDictionary new
]

{ #category : #options }
SBSMultiSelectPickerTag >> maxOptions: anInteger [ 

	self attributeAt: 'data-max-options' put: anInteger
]

{ #category : #'initialize-release' }
SBSMultiSelectPickerTag >> optionAt: aKey [
	^ self options at: aKey ifAbsent: [ nil ]
]

{ #category : #'initialize-release' }
SBSMultiSelectPickerTag >> optionAt: aKey put: aValue [
	^ self options at: aKey asString put: aValue
]

{ #category : #'initialize-release' }
SBSMultiSelectPickerTag >> options [
	^ options ifNil: [ self initializeOptions ]
]

{ #category : #'initialize-release' }
SBSMultiSelectPickerTag >> showActionBox [

	self showActionBoxIf: true
]

{ #category : #'initialize-release' }
SBSMultiSelectPickerTag >> showActionBoxIf: aBoolean [
	aBoolean
		ifTrue: [ self attributeAt: 'data-actions-box' put: 'true' ]
]

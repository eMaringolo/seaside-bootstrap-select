Class {
	#name : #TBSMultiSelectTag,
	#superclass : #WAMultiSelectTag,
	#instVars : [
		'autoinitialize'
	],
	#category : #'Bootstrap-Select-Core'
}

{ #category : #private }
TBSMultiSelectTag >> after [
	
	self autoinitialize ifTrue: [self initializationScriptUsing: canvas]
]

{ #category : #accessing }
TBSMultiSelectTag >> autoinitialize [
	
	^autoinitialize
]

{ #category : #accessing }
TBSMultiSelectTag >> autoinitialize: anObject [
	
	autoinitialize := anObject
]

{ #category : #initialization }
TBSMultiSelectTag >> initializationScriptUsing: aCanvas [
	
	aCanvas
		script:
			'
	 		$(''#' , (attributes at: 'id') , ''').selectpicker();'
]

{ #category : #'initialize-release' }
TBSMultiSelectTag >> initialize [
	
	super initialize.
	autoinitialize := true
]

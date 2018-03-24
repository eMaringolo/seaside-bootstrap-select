private
subtextFor: anObject
	
	^subtextsBlock isNil
		ifTrue: [anObject asString]
		ifFalse: [subtextsBlock value: anObject]
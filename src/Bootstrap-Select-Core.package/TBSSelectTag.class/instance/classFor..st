private
classFor: anObject
	
	^classBlock isNil
		ifTrue: [anObject]
		ifFalse: [classBlock value: anObject]
private
styleFor: anObject
	
	^styleBlock isNil
		ifTrue: [anObject]
		ifFalse: [styleBlock value: anObject]
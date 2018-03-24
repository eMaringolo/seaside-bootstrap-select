options
optionAt: aKey
	
	^self options
		at: aKey
		ifAbsent: [nil]
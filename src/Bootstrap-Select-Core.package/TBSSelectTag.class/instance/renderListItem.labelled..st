rendering-private
renderListItem: anObject labelled: aString
	
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
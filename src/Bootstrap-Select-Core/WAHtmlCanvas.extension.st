Extension { #name : #WAHtmlCanvas }

{ #category : #'*Bootstrap-Select-Core' }
WAHtmlCanvas >> sbsMultiSelect [ 
	
	^(self brush: SBSMultiSelectPickerTag new)
		class: 'selectpicker';
		ensureId;
		yourself
]

{ #category : #'*Bootstrap-Select-Core' }
WAHtmlCanvas >> sbsSelect [ 
	
	^(self brush: SBSSelectPickerTag new)
		class: 'selectpicker';
		ensureId;
		yourself
]

{ #category : #'*Bootstrap-Select-Core' }
WAHtmlCanvas >> tbsMultiSelect [ 
	
	self deprecated: 'Use #sbsMultiSelect instead.' transformWith: '`@receiver tbsMultiSelect' -> '`@receiver sbsMultiSelect'.
	^self sbsMultiSelect 
]

{ #category : #'*Bootstrap-Select-Core' }
WAHtmlCanvas >> tbsSelect [
	self
		deprecated: 'Use #sbsSelect instead.'
		transformWith: '`@receiver tbsSelect' -> '`@receiver sbsSelect'.
	^ self sbsSelect
]

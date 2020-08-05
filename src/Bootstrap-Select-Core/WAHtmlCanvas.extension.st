Extension { #name : #WAHtmlCanvas }

{ #category : #'*Bootstrap-Select-Core' }
WAHtmlCanvas >> tbsMultiSelect [ 
	
	^(self brush: TBSMultiSelectTag new)
		class: 'selectpicker';
		ensureId;
		yourself
]

{ #category : #'*Bootstrap-Select-Core' }
WAHtmlCanvas >> tbsSelect [ 
	
	^(self brush: TBSSelectTag new)
		class: 'selectpicker';
		ensureId;
		yourself
]

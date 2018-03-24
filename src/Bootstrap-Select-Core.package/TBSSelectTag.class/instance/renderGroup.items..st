private
renderGroup: group items: items
	
	(canvas optionGroup)
		label:
				(groupsBlock isNil
						ifTrue: [group]
						ifFalse: [self labelForGroup: group]);
		with: [self renderListItems: items]
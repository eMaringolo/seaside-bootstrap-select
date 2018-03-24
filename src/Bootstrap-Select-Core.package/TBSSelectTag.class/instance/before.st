private
before
	
	self isOptional ifTrue: [self renderOptional].
	self hasList
		ifTrue:
			[self hasGroups
				ifTrue:
					[self list
						keysAndValuesDo:
							[:group :items | self usesGroups ifTrue: [self renderGroup: group items: items]]]
				ifFalse: [self renderListItems: self list]]
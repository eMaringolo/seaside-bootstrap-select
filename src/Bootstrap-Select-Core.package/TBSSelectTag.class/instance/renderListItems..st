rendering-private
renderListItems: items
	
	items
		do:
			[:each | 
			self
				renderListItem: each
				labelled: (self labelForOption: each)]
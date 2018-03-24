accessing
list: aCollection
	"Append aCollection of items to display. The rendering can be customized using #labels:."
	
	list isNil
		ifTrue: [list := aCollection]
		ifFalse: [self addAll: aCollection]
configuration
hasGroups
	"Note: we test for #isSequenceable, because GRSmallDictionary returns false to #isDictionary."
	
	^self list isSequenceable not
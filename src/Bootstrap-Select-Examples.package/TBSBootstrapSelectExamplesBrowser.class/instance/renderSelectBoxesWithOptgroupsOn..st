rendering-basic
renderSelectBoxesWithOptgroupsOn: html
	| groups |
	groups := {('Picnic' -> self dressings).
	('Camping' -> self gear)} asDictionary.
	self tip: 'If you pass a Dictionary-like object it will use keys as the labels for the optgroups and values as the items of each group' on: html.
	html tbsSelect list: groups
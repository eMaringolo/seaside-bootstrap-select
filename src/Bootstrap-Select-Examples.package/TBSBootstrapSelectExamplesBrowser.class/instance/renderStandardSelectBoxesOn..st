rendering-basic
renderStandardSelectBoxesOn: html

	html paragraph: 'Make this:'.
	html select list: self dressings.
	
	html paragraph: 'Become this:'.
	html tbsSelect list: self dressings.

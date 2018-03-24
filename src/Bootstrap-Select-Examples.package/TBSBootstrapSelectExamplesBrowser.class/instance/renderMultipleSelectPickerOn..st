rendering-basic
renderMultipleSelectPickerOn: html

	self tip: 'Seaside requires a special tag to handle multiselection' on: html.
	html tbsMultiSelect
		list: self dressings.

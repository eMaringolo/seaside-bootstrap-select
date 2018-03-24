rendering
renderExamplesSideNavOn: html
	html tbsNav
		beStacked;
		with: [ self basicExamples
				keysAndValuesDo: [ :title :selector | 
					html
						tbsNavItem: [ html anchor
								url: '#' , selector asString;
								with: title ] ] ]
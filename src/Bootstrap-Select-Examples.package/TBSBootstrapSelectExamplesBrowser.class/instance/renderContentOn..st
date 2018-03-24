rendering
renderContentOn: html
	html
		tbsJumbotron: [ html tbsContainer: [ html heading with: 'Bootstrap Select' ] ].
	html
		tbsContainerFluid: [
			html tbsColumn
				mediumSize: 3;
				with: [ self renderExamplesSideNavOn: html ].
			html tbsColumn
				mediumSize: 9;
				with: [ self renderExamplesOn: html ] ]
rendering-support
renderExample: title selector: aSymbol on: html
	html
		tbsPanel
		beDefault;
		with: [ html
				tbsPanelHeading: [ html heading
						level3;
						id: aSymbol asString;
						with: title ].
			html tbsPanelBody: [ self perform: aSymbol with: html ].
			html
				tbsPanelFooter: [ html code: [ html preformatted: (self class methodNamed: aSymbol) sourceCode ] ] ]
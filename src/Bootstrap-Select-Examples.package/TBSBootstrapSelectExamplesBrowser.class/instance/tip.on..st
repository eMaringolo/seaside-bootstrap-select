rendering-support
tip: aString on: html
	html tbsAlert
		beInfo;
		with: [ html heading
				level3;
				with: 'Tip'.
			html paragraph: aString ]
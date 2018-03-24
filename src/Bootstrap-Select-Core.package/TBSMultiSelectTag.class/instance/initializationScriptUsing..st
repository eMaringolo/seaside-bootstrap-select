initialization
initializationScriptUsing: aCanvas
	
	aCanvas
		script:
			'
	 		$(''#' , (attributes at: 'id') , ''').selectpicker();'
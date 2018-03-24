initialization
initializationScriptUsing: aCanvas
	
	aCanvas
		script:
			(String
				streamContents:
					[:s | 
					s
						nextPutAll: '$("#';
						nextPutAll: (attributes at: 'id');
						nextPutAll: '").selectpicker('.
					self options isEmpty ifFalse: [self options javascriptOn: s].
					s nextPutAll: ');'])
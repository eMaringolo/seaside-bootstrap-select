uploaded metadata
cssbootstrapselectcssMap
	^ WAFileLibraryResource
		filepath: 'css/bootstrap-select.css.map'
		mimeType: (WAMimeType main: 'application' sub: 'octet-stream')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #cssbootstrapselectcssMapContent)
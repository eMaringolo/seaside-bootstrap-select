testing
register

	|app|
	app := WAAdmin register: self asApplicationAt: self handlerName.
	app 
		addLibrary: JQDeploymentLibrary;
		addLibrary: TBSDevelopmentLibrary;
		addLibrary: TBSSelectDevelopmentLibrary
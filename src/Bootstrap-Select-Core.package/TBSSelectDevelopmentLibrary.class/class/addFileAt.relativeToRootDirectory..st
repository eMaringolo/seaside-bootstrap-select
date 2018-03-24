adding
addFileAt: aPath relativeToRootDirectory: relativeRootDirectory
	(self isDeploymentFile: aPath)
		ifFalse: [ super
				addFileAt: aPath
				relativeToRootDirectory: relativeRootDirectory ]
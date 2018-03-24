adding
addFileAt: aPath relativeToRootDirectory: relativeRootDirectory
	(self isDeploymentFile: aPath)
		ifTrue: [ super
				addFileAt: aPath
				relativeToRootDirectory: relativeRootDirectory ]
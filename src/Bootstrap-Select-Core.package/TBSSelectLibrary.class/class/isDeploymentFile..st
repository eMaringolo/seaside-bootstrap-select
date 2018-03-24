adding
isDeploymentFile: aPath
	^ ('*.min.*' match: aPath) or: [ '*.map' match: aPath ]
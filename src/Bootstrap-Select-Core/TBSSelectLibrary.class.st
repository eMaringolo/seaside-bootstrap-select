Class {
	#name : #TBSSelectLibrary,
	#superclass : #WAFileMetadataLibrary,
	#category : #'Bootstrap-Select-Core'
}

{ #category : #adding }
TBSSelectLibrary class >> isDeploymentFile: aPath [
	^ ('*.min.*' match: aPath) or: [ '*.map' match: aPath ]
]

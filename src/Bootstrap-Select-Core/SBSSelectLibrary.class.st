Class {
	#name : #SBSSelectLibrary,
	#superclass : #WAFileMetadataLibrary,
	#category : #'Bootstrap-Select-Core'
}

{ #category : #adding }
SBSSelectLibrary class >> isDeploymentFile: aPath [
	^ ('*.min.*' match: aPath) or: [ '*.map' match: aPath ]
]

"
I am a class implementing an abstract parent class for all the Links
"
Class {
	#name : 'OPDemoLinkController',
	#superclass : 'OPDirectionalRelationshipController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoLinkController >> diagramElementClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoLinkController >> modelClass [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoLinkController >> removeModel [

	self diagramController model remove: self model.
	super removeModel
]

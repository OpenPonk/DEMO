Class {
	#name : 'OPDemoLinkController',
	#superclass : 'OPDirectionalRelationshipController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoLinkController >> diagramElementClass [

	^ OPDemoTargetInitiatorLinkShape 
]

{ #category : 'accessing' }
OPDemoLinkController >> modelClass [
	^ OPDemoLink
]

Class {
	#name : 'OPDemoLinkController',
	#superclass : 'OPDemoElementController',
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

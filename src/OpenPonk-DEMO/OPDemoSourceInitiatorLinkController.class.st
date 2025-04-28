"
I represent a controller for Executor Link
"
Class {
	#name : 'OPDemoSourceInitiatorLinkController',
	#superclass : 'OPDemoLinkController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoSourceInitiatorLinkController >> diagramElementClass [

	^ OPDemoSourceInitiatorLinkShape 
]

{ #category : 'construction' }
OPDemoSourceInitiatorLinkController >> modelClass [
	^ OPDemoSourceInitiatorLink 
]

"
I represent a controller for Initiator Link
"
Class {
	#name : 'OPDemoTargetInitiatorLinkController',
	#superclass : 'OPDemoLinkController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoTargetInitiatorLinkController >> diagramElementClass [

	^ OPDemoTargetInitiatorLinkShape 
]

{ #category : 'construction' }
OPDemoTargetInitiatorLinkController >> modelClass [
	^ OPDemoTargetInitiatorLink 
]

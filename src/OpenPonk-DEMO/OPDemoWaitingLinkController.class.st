Class {
	#name : 'OPDemoWaitingLinkController',
	#superclass : 'OPDemoLinkController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoWaitingLinkController >> diagramElementClass [

	^ OPDemoWaitingLinkShape 
]

{ #category : 'construction' }
OPDemoWaitingLinkController >> modelClass [
	^ OPDemoWaitingLink 
]

"
I represent a controller for Access Link
"
Class {
	#name : 'OPDemoAccessLinkController',
	#superclass : 'OPDemoLinkController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoAccessLinkController >> diagramElementClass [

	^ OPDemoAccessLinkShape 
]

{ #category : 'construction' }
OPDemoAccessLinkController >> modelClass [
	^ OPDemoAccessLink 
]

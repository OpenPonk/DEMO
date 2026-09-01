"
Controller for DEMO source initiator (executor) links.
Manages diagram lifecycle and interactions for connections linking an actor role to a transaction it executes.
"
Class {
	#name : 'OPDemoSourceInitiatorLinkController',
	#superclass : 'OPDemoLinkController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoSourceInitiatorLinkController class >> diagramElementClass [

	^ OPDemoSourceInitiatorLinkShape 
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkController class >> viewModelClass [
	^ OPDemoSourceInitiatorLinkViewModel
]

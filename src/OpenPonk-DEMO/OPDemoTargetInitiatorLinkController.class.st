"
Controller for DEMO target initiator links.
Manages diagram lifecycle and interactions for connections linking a transaction back to its initiating actor role.
"
Class {
	#name : 'OPDemoTargetInitiatorLinkController',
	#superclass : 'OPDemoLinkController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoTargetInitiatorLinkController class >> diagramElementClass [

	^ OPDemoTargetInitiatorLinkShape 
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkController class >> viewModelClass [
	^ OPDemoTargetInitiatorLinkViewModel
]

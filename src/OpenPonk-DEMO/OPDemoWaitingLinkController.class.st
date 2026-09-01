"
Controller for DEMO waiting links.
Manages diagram lifecycle and interactions for connections denoting a waiting dependency between elements.
"
Class {
	#name : 'OPDemoWaitingLinkController',
	#superclass : 'OPDemoLinkController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoWaitingLinkController class >> diagramElementClass [

	^ OPDemoWaitingLinkShape 
]

{ #category : 'accessing' }
OPDemoWaitingLinkController class >> viewModelClass [
	^ OPDemoWaitingLinkViewModel
]

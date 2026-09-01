"
Controller for DEMO access links.
Manages the diagram lifecycle and interactions for connections denoting access to a fact bank or transaction result.
"
Class {
	#name : 'OPDemoAccessLinkController',
	#superclass : 'OPDemoLinkController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoAccessLinkController class >> diagramElementClass [

	^ OPDemoAccessLinkShape 
]

{ #category : 'accessing' }
OPDemoAccessLinkController class >> viewModelClass [
	^ OPDemoAccessLinkViewModel
]

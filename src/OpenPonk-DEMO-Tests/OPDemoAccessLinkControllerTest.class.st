"
Tests controller logic and arrow presentations for DEMO access links.
"
Class {
	#name : 'OPDemoAccessLinkControllerTest',
	#superclass : 'OPDemoLinkControllerTest',
	#category : 'OpenPonk-DEMO-Tests-Controllers',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoAccessLinkControllerTest class >> diagramElementClass [
	^ OPDemoAccessLinkShape
]

{ #category : 'accessing' }
OPDemoAccessLinkControllerTest >> controllerClass [
	^ OPDemoAccessLinkController
]

{ #category : 'accessing' }
OPDemoAccessLinkControllerTest >> modelClass [
	^ OPDemoAccessLink
]

{ #category : 'accessing' }
OPDemoAccessLinkControllerTest >> sourceControllerClass [
	^ OPDemoInternalActorController
]

{ #category : 'accessing' }
OPDemoAccessLinkControllerTest >> sourceModelClass [
	^ OPDemoInternalActor
]

{ #category : 'accessing' }
OPDemoAccessLinkControllerTest >> targetControllerClass [
	^ OPDemoFactsController
]

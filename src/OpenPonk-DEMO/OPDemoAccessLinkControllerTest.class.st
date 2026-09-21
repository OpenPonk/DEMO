Class {
	#name : 'OPDemoAccessLinkControllerTest',
	#superclass : 'OPDemoLinkControllerTest',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
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

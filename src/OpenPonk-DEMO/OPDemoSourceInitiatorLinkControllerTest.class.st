Class {
	#name : 'OPDemoSourceInitiatorLinkControllerTest',
	#superclass : 'OPDemoLinkControllerTest',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkControllerTest class >> diagramElementClass [
	^ OPDemoSourceInitiatorLinkShape
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkControllerTest >> controllerClass [
	^ OPDemoSourceInitiatorLinkController
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkControllerTest >> modelClass [
	^ OPDemoSourceInitiatorLink
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkControllerTest >> sourceControllerClass [
	^ OPDemoInternalActorController
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkControllerTest >> sourceModelClass [
	^ OPDemoInternalActor
]

{ #category : 'accessing' }
OPDemoSourceInitiatorLinkControllerTest >> targetControllerClass [
	^ OPDemoStandardInternalTransactionController
]

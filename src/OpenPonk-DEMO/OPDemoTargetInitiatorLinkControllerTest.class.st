Class {
	#name : 'OPDemoTargetInitiatorLinkControllerTest',
	#superclass : 'OPDemoLinkControllerTest',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkControllerTest class >> diagramElementClass [
	^ OPDemoTargetInitiatorLinkShape
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkControllerTest >> controllerClass [
	^ OPDemoTargetInitiatorLinkController
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkControllerTest >> modelClass [
	^ OPDemoTargetInitiatorLink
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkControllerTest >> sourceControllerClass [
	^ OPDemoInternalActorController
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkControllerTest >> sourceModelClass [
	^ OPDemoInternalActor
]

{ #category : 'accessing' }
OPDemoTargetInitiatorLinkControllerTest >> targetControllerClass [
	^ OPDemoStandardInternalTransactionController
]

"
Tests controller interactions and visual indicators for DEMO waiting links.
"
Class {
	#name : 'OPDemoWaitingLinkControllerTest',
	#superclass : 'OPDemoLinkControllerTest',
	#category : 'OpenPonk-DEMO-Tests-Controllers',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoWaitingLinkControllerTest class >> diagramElementClass [
	^ OPDemoWaitingLinkShape
]

{ #category : 'accessing' }
OPDemoWaitingLinkControllerTest >> controllerClass [
	^ OPDemoWaitingLinkController
]

{ #category : 'accessing' }
OPDemoWaitingLinkControllerTest >> modelClass [
	^ OPDemoWaitingLink
]

{ #category : 'accessing' }
OPDemoWaitingLinkControllerTest >> sourceControllerClass [
	^ OPDemoStandardInternalTransactionController
]

{ #category : 'accessing' }
OPDemoWaitingLinkControllerTest >> sourceModelClass [
	^ OPDemoStandardInternalTransaction
]

{ #category : 'accessing' }
OPDemoWaitingLinkControllerTest >> targetControllerClass [
	^ OPDemoInternalActorController
]

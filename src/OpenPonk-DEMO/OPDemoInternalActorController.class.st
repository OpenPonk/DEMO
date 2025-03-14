Class {
	#name : 'OPDemoInternalActorController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoInternalActorController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoInternalActorController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'construction' }
OPDemoInternalActorController >> diagramElementClass [

	^ OPDemoInternalActorShape
]

{ #category : 'accessing' }
OPDemoInternalActorController >> modelClass [
	^ OPDemoInternalActor
]

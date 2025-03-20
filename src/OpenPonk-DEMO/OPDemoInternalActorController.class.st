Class {
	#name : 'OPDemoInternalActorController',
	#superclass : 'OPDemoActorController',
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

{ #category : 'construction' }
OPDemoInternalActorController >> diagramElementClass [

	^ OPDemoInternalActorShape
]

{ #category : 'initialization' }
OPDemoInternalActorController >> initialize [
	super initialize.
	transactionCount := 0
]

{ #category : 'accessing' }
OPDemoInternalActorController >> modelClass [
	^ OPDemoInternalActor
]

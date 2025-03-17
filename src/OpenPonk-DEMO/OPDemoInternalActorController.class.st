Class {
	#name : 'OPDemoInternalActorController',
	#superclass : 'OPDemoElementController',
	#instVars : [
		'transactionCount'
	],
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
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink) or: 
	[(aController modelClass = OPDemoStandardInternalTransaction ) and: self model transactionCount = 0]]]]]
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

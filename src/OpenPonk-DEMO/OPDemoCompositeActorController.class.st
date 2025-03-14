Class {
	#name : 'OPDemoCompositeActorController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoCompositeActorController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoCompositeActorController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'construction' }
OPDemoCompositeActorController >> diagramElementClass [

	^ OPDemoCompositeActorShape
]

{ #category : 'accessing' }
OPDemoCompositeActorController >> modelClass [
	^ OPDemoCompositeActor
]

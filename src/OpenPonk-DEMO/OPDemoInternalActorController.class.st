Class {
	#name : 'OPDemoInternalActorController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoInternalActorController >> diagramElementClass [

	^ OPDemoInternalActorShape
]

{ #category : 'accessing' }
OPDemoInternalActorController >> modelClass [
	^ OPDemoInternalActor
]

Class {
	#name : 'OPDemoCompositeActorController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoCompositeActorController >> diagramElementClass [

	^ OPDemoCompositeActorShape
]

{ #category : 'accessing' }
OPDemoCompositeActorController >> modelClass [
	^ OPDemoCompositeActor
]

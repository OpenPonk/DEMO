"
I am a controller for a composite Actor Role
"
Class {
	#name : 'OPDemoCompositeActorController',
	#superclass : 'OPDemoActorController',
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

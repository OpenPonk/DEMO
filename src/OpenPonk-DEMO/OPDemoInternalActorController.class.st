"
I am a controller for an internal Actor Role
"
Class {
	#name : 'OPDemoInternalActorController',
	#superclass : 'OPDemoActorController',
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

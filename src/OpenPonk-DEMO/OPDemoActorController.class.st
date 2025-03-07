Class {
	#name : 'OPDemoActorController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoActorController >> diagramElementClass [

	^ OPDemoInternalActorShape 
]

{ #category : 'accessing' }
OPDemoActorController >> modelClass [
	^ OPDemoActor
]

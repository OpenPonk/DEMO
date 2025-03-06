Class {
	#name : 'OPDemoActorController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-DiagramControllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramControllers'
}

{ #category : 'accessing' }
OPDemoActorController >> diagramElementClass [

	^ OPDemoActorController 
]

{ #category : 'accessing' }
OPDemoActorController >> modelClass [
	^ OPDemoActor
]

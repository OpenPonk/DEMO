"
Controller for DEMO composite Actor Roles.
Manages diagram lifecycle and UI synchronization for actors containing internal transaction elements.
"
Class {
	#name : 'OPDemoCompositeActorController',
	#superclass : 'OPDemoActorController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoCompositeActorController class >> diagramElementClass [

	^ OPDemoCompositeActorShape
]

{ #category : 'accessing' }
OPDemoCompositeActorController class >> viewModelClass [
	^ OPDemoCompositeActorViewModel
]

"
Controller for DEMO internal Actor Roles.
Manages diagram lifecycle and interactions for internal actor elements.
"
Class {
	#name : 'OPDemoInternalActorController',
	#superclass : 'OPDemoActorController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoInternalActorController class >> diagramElementClass [

	^ OPDemoInternalActorShape
]

{ #category : 'accessing' }
OPDemoInternalActorController class >> viewModelClass [
	^ OPDemoInternalActorViewModel
]

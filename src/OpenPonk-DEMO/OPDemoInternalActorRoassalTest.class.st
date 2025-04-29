Class {
	#name : 'OPDemoInternalActorRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPDemoInternalActorRoassalTest >> controllerClass [
	^ OPDemoInternalActorController 
]

{ #category : 'construction' }
OPDemoInternalActorRoassalTest >> diagramElementClass [

	^ OPDemoInternalActorShape 
]

{ #category : 'accessing' }
OPDemoInternalActorRoassalTest >> modelClass [
	^ OPDemoInternalActor
]

{ #category : 'accessing' }
OPDemoInternalActorRoassalTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSBox).
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (actorWidthHeight + actorBorderSize ).
	self assert: controller roassalShape extent y equals: (actorWidthHeight + actorBorderSize ).
]

"
Unit tests for OPDemoCompositeActorController and its integration with diagram elements.
Verifies diagram interactions such as creation using target additions.
"
Class {
	#name : 'OPDemoCompositeActorRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoCompositeActorRoassalTest class >> diagramElementClass [

	^ OPDemoCompositeActorShape 
]

{ #category : 'constants' }
OPDemoCompositeActorRoassalTest >> controllerClass [
	^ OPDemoCompositeActorController 
]

{ #category : 'constants' }
OPDemoCompositeActorRoassalTest >> modelClass [
	^ OPDemoCompositeActor
]

{ #category : 'tests' }
OPDemoCompositeActorRoassalTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSBox).
	self assert: controller roassalShape color equals: Color gray.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (actorWidthHeight + actorBorderSize ).
	self assert: controller roassalShape extent y equals: (actorWidthHeight + actorBorderSize ).
]

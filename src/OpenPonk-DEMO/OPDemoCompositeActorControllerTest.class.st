"
Unit tests for OPDemoCompositeActorController and its integration with diagram elements.
Verifies diagram interactions such as creation using target additions.
"
Class {
	#name : 'OPDemoCompositeActorControllerTest',
	#superclass : 'OPDemoElementControllerTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoCompositeActorControllerTest class >> diagramElementClass [

	^ OPDemoCompositeActorShape 
]

{ #category : 'constants' }
OPDemoCompositeActorControllerTest >> controllerClass [
	^ OPDemoCompositeActorController 
]

{ #category : 'constants' }
OPDemoCompositeActorControllerTest >> modelClass [
	^ OPDemoCompositeActor
]

{ #category : 'tests' }
OPDemoCompositeActorControllerTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSBox).
	self assert: controller roassalShape color equals: Color gray.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (actorWidthHeight + actorBorderSize ).
	self assert: controller roassalShape extent y equals: (actorWidthHeight + actorBorderSize ).
]

"
Unit tests for OPDemoInternalActorController and its integration with diagram elements.
Verifies the rendering logic and diagram lifecycle for internal actors.
"
Class {
	#name : 'OPDemoInternalActorRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoInternalActorRoassalTest class >> diagramElementClass [

	^ OPDemoInternalActorShape 
]

{ #category : 'constants' }
OPDemoInternalActorRoassalTest >> controllerClass [
	^ OPDemoInternalActorController 
]

{ #category : 'constants' }
OPDemoInternalActorRoassalTest >> modelClass [
	^ OPDemoInternalActor
]

{ #category : 'tests' }
OPDemoInternalActorRoassalTest >> testCreateUsingAddAsTarget [

	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSBox).
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape border color equals: Color black.
	self
		assert: controller roassalShape extent x
		equals: actorWidthHeight + actorBorderSize.
	self
		assert: controller roassalShape extent y
		equals: actorWidthHeight + actorBorderSize
]

"
Unit tests for OPDemoInternalActorController and its integration with diagram elements.
Verifies the rendering logic and diagram lifecycle for internal actors.
"
Class {
	#name : 'OPDemoInternalActorControllerTest',
	#superclass : 'OPDemoElementControllerTest',
	#category : 'OpenPonk-DEMO-Tests-Controllers',
	#package : 'OpenPonk-DEMO-Tests',
	#tag : 'Controllers'
}

{ #category : 'constants' }
OPDemoInternalActorControllerTest class >> diagramElementClass [

	^ OPDemoInternalActorShape 
]

{ #category : 'constants' }
OPDemoInternalActorControllerTest >> controllerClass [
	^ OPDemoInternalActorController 
]

{ #category : 'constants' }
OPDemoInternalActorControllerTest >> modelClass [
	^ OPDemoInternalActor
]

{ #category : 'tests' }
OPDemoInternalActorControllerTest >> testCreateUsingAddAsTarget [

	super testCreateUsingAddAsTarget.
	self assert: controller roassalShape class identicalTo: RSBox.
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: actorWidthHeight + actorBorderSize.
	self assert: controller roassalShape extent y equals: actorWidthHeight + actorBorderSize
]

"
Unit tests for OPDemoFactsController and its integration with diagram elements.
Verifies the rendering logic and diagram lifecycle for fact banks.
"
Class {
	#name : 'OPDemoFactsControllerTest',
	#superclass : 'OPDemoElementControllerTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoFactsControllerTest class >> diagramElementClass [
	^ OPDemoFactsShape
]

{ #category : 'constants' }
OPDemoFactsControllerTest >> controllerClass [
	^ OPDemoFactsController 
]

{ #category : 'constants' }
OPDemoFactsControllerTest >> modelClass [
	^ OPDemoFacts
]

{ #category : 'tests' }
OPDemoFactsControllerTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSCircle).
	self assert: controller roassalShape color equals: Color gray.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (factsHeightWidth + transactionBorderSize ).
	self assert: controller roassalShape extent y equals: (factsHeightWidth + transactionBorderSize ).
	self assert: controller diagramElement attachedSquare color equals: Color transparent.
	self assert: controller diagramElement attachedSquare border color equals: Color black.
	self assert: controller diagramElement attachedCircle color equals: Color gray.
	self assert: controller diagramElement attachedCircle border color equals: Color black.
]

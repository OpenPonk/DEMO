"
Unit tests for OPDemoStandardCompositeTransactionController and its integration with diagram elements.
Verifies rendering and diagram interactions for standard composite transactions.
"
Class {
	#name : 'OPDemoStandardCompositeControllerTest',
	#superclass : 'OPDemoElementControllerTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoStandardCompositeControllerTest class >> diagramElementClass [
	^ OPDemoStandardCompositeTransactionShape
]

{ #category : 'constants' }
OPDemoStandardCompositeControllerTest >> controllerClass [
	^ OPDemoStandardCompositeTransactionController
]

{ #category : 'constants' }
OPDemoStandardCompositeControllerTest >> modelClass [
	^ OPDemoStandardCompositeTransaction
]

{ #category : 'tests' }
OPDemoStandardCompositeControllerTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSCircle).
	self assert: controller roassalShape color equals: Color gray.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (transactionWidthHeight + transactionBorderSize ).
	self assert: controller roassalShape extent y equals: (transactionWidthHeight + transactionBorderSize ).
	self assert: controller diagramElement attachedSquare color equals: Color transparent.
	self assert: controller diagramElement attachedSquare border color equals: Color red.
]

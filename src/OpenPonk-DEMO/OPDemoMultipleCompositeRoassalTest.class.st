"
Unit tests for OPDemoMultipleCompositeTransactionController and its integration with diagram elements.
Verifies rendering and diagram interactions for multiple composite transactions.
"
Class {
	#name : 'OPDemoMultipleCompositeRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoMultipleCompositeRoassalTest class >> diagramElementClass [
	^ OPDemoMultipleCompositeTransactionShape
]

{ #category : 'constants' }
OPDemoMultipleCompositeRoassalTest >> controllerClass [
	^ OPDemoMultipleCompositeTransactionController
]

{ #category : 'constants' }
OPDemoMultipleCompositeRoassalTest >> modelClass [
	^ OPDemoMultipleCompositeTransaction
]

{ #category : 'tests' }
OPDemoMultipleCompositeRoassalTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSCircle).
	self assert: controller roassalShape color equals: Color gray.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (transactionWidthHeight + transactionBorderSize ).
	self assert: controller roassalShape extent y equals: (transactionWidthHeight + transactionBorderSize ).
	self assert: controller diagramElement attachedSquare color equals: Color transparent.
	self assert: controller diagramElement attachedSquare border color equals: Color red.
	self assert: controller diagramElement attachedCircle color equals: Color gray.
	self assert: controller diagramElement attachedCircle border color equals: Color black.
]

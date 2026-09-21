"
Unit tests for OPDemoMultipleInternalTransactionController and its integration with diagram elements.
Verifies rendering and diagram interactions for multiple internal transactions.
"
Class {
	#name : 'OPDemoMultipleInternalControllerTest',
	#superclass : 'OPDemoElementControllerTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoMultipleInternalControllerTest class >> diagramElementClass [
	^ OPDemoMultipleInternalTransactionShape
]

{ #category : 'constants' }
OPDemoMultipleInternalControllerTest >> controllerClass [
	^ OPDemoMultipleInternalTransactionController
]

{ #category : 'constants' }
OPDemoMultipleInternalControllerTest >> modelClass [
	^ OPDemoMultipleInternalTransaction
]

{ #category : 'tests' }
OPDemoMultipleInternalControllerTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSCircle).
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (transactionWidthHeight + transactionBorderSize ).
	self assert: controller roassalShape extent y equals: (transactionWidthHeight + transactionBorderSize ).
	self assert: controller diagramElement attachedSquare color equals: Color transparent.
	self assert: controller diagramElement attachedSquare border color equals: Color red.
	self assert: controller diagramElement attachedCircle color equals: Color white.
	self assert: controller diagramElement attachedCircle border color equals: Color black.
]

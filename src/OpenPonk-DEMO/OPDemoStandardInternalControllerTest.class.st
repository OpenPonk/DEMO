"
Unit tests for OPDemoStandardInternalTransactionController and its integration with diagram elements.
Verifies rendering and diagram interactions for standard internal transactions.
"
Class {
	#name : 'OPDemoStandardInternalControllerTest',
	#superclass : 'OPDemoElementControllerTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoStandardInternalControllerTest class >> diagramElementClass [
	^ OPDemoStandardInternalTransactionShape
]

{ #category : 'constants' }
OPDemoStandardInternalControllerTest >> controllerClass [
	^ OPDemoStandardInternalTransactionController
]

{ #category : 'constants' }
OPDemoStandardInternalControllerTest >> modelClass [
	^ OPDemoStandardInternalTransaction
]

{ #category : 'tests' }
OPDemoStandardInternalControllerTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSCircle).
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (transactionWidthHeight + transactionBorderSize ).
	self assert: controller roassalShape extent y equals: (transactionWidthHeight + transactionBorderSize ).
]

Class {
	#name : 'OPDemoStandardInternalRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPDemoStandardInternalRoassalTest >> controllerClass [
	^ OPDemoStandardInternalTransactionController
]

{ #category : 'accessing' }
OPDemoStandardInternalRoassalTest >> diagramElementClass [
	^ OPDemoStandardInternalTransactionShape
]

{ #category : 'accessing' }
OPDemoStandardInternalRoassalTest >> modelClass [
	^ OPDemoStandardInternalTransaction
]

{ #category : 'accessing' }
OPDemoStandardInternalRoassalTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSCircle).
	self assert: controller roassalShape color equals: Color white.
	self assert: controller roassalShape border color equals: Color black.
	self assert: controller roassalShape extent x equals: (transactionWidthHeight + transactionBorderSize ).
	self assert: controller roassalShape extent y equals: (transactionWidthHeight + transactionBorderSize ).
]

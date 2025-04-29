Class {
	#name : 'OPDemoFactsRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPDemoFactsRoassalTest >> controllerClass [
	^ OPDemoFactsController 
]

{ #category : 'accessing' }
OPDemoFactsRoassalTest >> diagramElementClass [
	^ OPDemoFactsShape
]

{ #category : 'accessing' }
OPDemoFactsRoassalTest >> modelClass [
	^ OPDemoFacts
]

{ #category : 'accessing' }
OPDemoFactsRoassalTest >> testCreateUsingAddAsTarget [
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

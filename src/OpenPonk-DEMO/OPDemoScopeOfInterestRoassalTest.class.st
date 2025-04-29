Class {
	#name : 'OPDemoScopeOfInterestRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPDemoScopeOfInterestRoassalTest >> controllerClass [
	^ OPDemoScopeOfInterestController 
]

{ #category : 'accessing' }
OPDemoScopeOfInterestRoassalTest >> diagramElementClass [
	^ OPDemoScopeOfInterestShape 
]

{ #category : 'accessing' }
OPDemoScopeOfInterestRoassalTest >> modelClass [
	^ OPDemoScopeOfInterest 
]

{ #category : 'accessing' }
OPDemoScopeOfInterestRoassalTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSBox).
	self assert: controller roassalShape color equals: Color transparent .
	self assert: controller roassalShape border color equals: Color gray.
	self assert: controller roassalShape extent x equals: (scopeOfInterestWidth + scopeOfInterestBorderSize ).
	self assert: controller roassalShape extent y equals: (scopeOfInterestHeight + scopeOfInterestBorderSize ).
]

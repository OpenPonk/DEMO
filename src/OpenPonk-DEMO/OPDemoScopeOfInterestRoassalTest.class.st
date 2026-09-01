"
Unit tests for OPDemoScopeOfInterestController and its integration with diagram elements.
Verifies rendering logic and boundary constraints for the scope of interest.
"
Class {
	#name : 'OPDemoScopeOfInterestRoassalTest',
	#superclass : 'OPDemoRoassalTest',
	#category : 'OpenPonk-DEMO-Tests',
	#package : 'OpenPonk-DEMO',
	#tag : 'Tests'
}

{ #category : 'constants' }
OPDemoScopeOfInterestRoassalTest class >> diagramElementClass [
	^ OPDemoScopeOfInterestShape 
]

{ #category : 'constants' }
OPDemoScopeOfInterestRoassalTest >> controllerClass [
	^ OPDemoScopeOfInterestController 
]

{ #category : 'constants' }
OPDemoScopeOfInterestRoassalTest >> modelClass [
	^ OPDemoScopeOfInterest 
]

{ #category : 'tests' }
OPDemoScopeOfInterestRoassalTest >> testCreateUsingAddAsTarget [
	self setUp.
	super testCreateUsingAddAsTarget.
	self assert: (controller roassalShape isKindOf: RSBox).
	self assert: controller roassalShape color equals: Color transparent .
	self assert: controller roassalShape border color equals: Color gray.
	self assert: controller roassalShape extent x equals: (scopeOfInterestWidth + scopeOfInterestBorderSize ).
	self assert: controller roassalShape extent y equals: (scopeOfInterestHeight + scopeOfInterestBorderSize ).
]

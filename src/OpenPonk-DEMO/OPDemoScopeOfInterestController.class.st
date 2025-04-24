Class {
	#name : 'OPDemoScopeOfInterestController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> canBeSourceFor: aController [
	^ aController isKindOf: OPDemoAccessLinkController 
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> canBeTargetFor: aController [
	^ (aController isKindOf: OPDemoElementController) or: (aController isKindOf: OPDemoAccessLinkController )
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> diagramElementClass [

	^ OPDemoScopeOfInterestShape 
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> elementsToShowInside [

	^ self model elements
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> modelClass [
	^ OPDemoScopeOfInterest 
]

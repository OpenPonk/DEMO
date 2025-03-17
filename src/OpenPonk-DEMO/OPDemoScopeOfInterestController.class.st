Class {
	#name : 'OPDemoScopeOfInterestController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> canBeTargetFor: aController [
	^ aController isKindOf: OPDemoElementController
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> diagramElementClass [

	^ OPDemoScopeOfInterestShape 
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> modelClass [
	^ OPDemoScopeOfInterest 
]

"
Controller for the DEMO Scope of Interest boundary.
Determines connection rules and manages diagram interactions for the scope boundary element.
"
Class {
	#name : 'OPDemoScopeOfInterestController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoScopeOfInterestController class >> diagramElementClass [

	^ OPDemoScopeOfInterestShape 
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController class >> viewModelClass [
	^ OPDemoScopeOfInterestViewModel
]

{ #category : 'connecting' }
OPDemoScopeOfInterestController >> canBeSourceFor: aController [
	^ aController isKindOf: OPDemoAccessLinkController 
]

{ #category : 'connecting' }
OPDemoScopeOfInterestController >> canBeTargetFor: aController [
	(aController isKindOf: OPDemoScopeOfInterestController) ifTrue: [ ^ false ].
	^ (aController isKindOf: OPDemoElementController) or: (aController isKindOf: OPDemoAccessLinkController )
]

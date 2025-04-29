"
I am a class representing a controller for a Scope of Interest
"
Class {
	#name : 'OPDemoScopeOfInterestController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> buildEditorForm: aForm [

	(aForm addText: 'Name')
		text: self model name;
		whenTextChangedDo: [ :newValue |
			self model name: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> canBeSourceFor: aController [
	^ aController isKindOf: OPDemoAccessLinkController 
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> canBeTargetFor: aController [
	(aController isKindOf: OPDemoScopeOfInterestController) ifTrue: [ ^ false ].
	^ (aController isKindOf: OPDemoElementController) or: (aController isKindOf: OPDemoAccessLinkController )
]

{ #category : 'accessing' }
OPDemoScopeOfInterestController >> dependentElements [
	"|onlyNodes|
	onlyNodes := (self model elements select: [ :each | each isNode ]).
	onlyNodes do: [ :each | UIManager default inform: each asString ]."
	^ (self model incoming , self model outgoing , self model elements ) asSet
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

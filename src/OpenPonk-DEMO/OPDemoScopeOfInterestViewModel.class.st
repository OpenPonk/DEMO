"
View model for the DEMO Scope of Interest.
Handles model dependencies, child elements, and form specifications for the scope boundary.
"
Class {
	#name : 'OPDemoScopeOfInterestViewModel',
	#superclass : 'OPDemoElementViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoScopeOfInterestViewModel class >> modelClass [ ^ OPDemoScopeOfInterest
]

{ #category : 'forms' }
OPDemoScopeOfInterestViewModel >> buildEditorForm: aForm [

	(aForm addText: 'Name')
		text: self model name;
		whenTextChangedDo: [ :newValue |
			self model name: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoScopeOfInterestViewModel >> childrenModels [ ^ super childrenModels , self model nodes asArray , self model edges asArray
]

{ #category : 'accessing' }
OPDemoScopeOfInterestViewModel >> dependentElements [
	"|onlyNodes|
	onlyNodes := (self model elements select: [ :each | each isNode ]).
	onlyNodes do: [ :each | UIManager default inform: each asString ]."
	^ (self model incoming , self model outgoing , self model elements ) asSet
]

{ #category : 'accessing' }
OPDemoScopeOfInterestViewModel >> essentialChildrenModels [
			^ self model elements asArray
]

{ #category : 'accessing' }
OPDemoScopeOfInterestViewModel >> icon [ ^ OPDemoEditorIcons scopeOfInterest16Icon
]

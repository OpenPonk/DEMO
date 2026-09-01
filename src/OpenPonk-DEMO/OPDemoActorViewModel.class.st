"
View model for DEMO Actor Roles. Handles model manipulations, manages child dependencies, and exposes form specifications for actor properties.
"
Class {
	#name : 'OPDemoActorViewModel',
	#superclass : 'OPDemoElementViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'testing' }
OPDemoActorViewModel class >> isAbstract [

	^ self = OPDemoActorViewModel
]

{ #category : 'accessing' }
OPDemoActorViewModel class >> modelClass [ ^ OPDemoActor
]

{ #category : 'private' }
OPDemoActorViewModel >> basicRemoveModel [

	self model elements do: [ :each | each removeModel ].
	super basicRemoveModel
]

{ #category : 'forms' }
OPDemoActorViewModel >> buildEditorForm: aForm [
	|text|
	text := self model labelActor.
	super buildEditorForm: aForm.

	(aForm addText: 'Name')
		text: text;
		whenTextChangedDo: [ :newValue |
			self model labelActor: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoActorViewModel >> childrenModels [ ^ super childrenModels , self model transactions asArray
]

{ #category : 'accessing' }
OPDemoActorViewModel >> dependentElements [

	^ (self model incoming , self model outgoing , self model elements) asSet
]

{ #category : 'accessing' }
OPDemoActorViewModel >> essentialChildrenModels [
			^ self model elements asArray
]

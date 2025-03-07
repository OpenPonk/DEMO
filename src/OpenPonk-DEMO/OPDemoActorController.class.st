Class {
	#name : 'OPDemoActorController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoActorController >> buildEditorForm: aForm [

	super buildEditorForm: aForm.
	(aForm addCheckbox: 'Composite')
		state: self model isComposite;
		whenChangedDo: [ :newValue |
			self model isComposite: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoActorController >> diagramElementClass [

	^ OPDemoInternalActorShape 
]

{ #category : 'accessing' }
OPDemoActorController >> modelClass [
	^ OPDemoActor
]

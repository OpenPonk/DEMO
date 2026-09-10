"
View model for DEMO Fact Banks.
Provides form building specifications and icons to the workbench and UI layers without direct GUI dependencies.
"
Class {
	#name : 'OPDemoFactsViewModel',
	#superclass : 'OPDemoElementViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPDemoFactsViewModel class >> modelClass [ ^ OPDemoFacts
]

{ #category : 'forms' }
OPDemoFactsViewModel >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Name')
		text: (self model labelFacts ifNil: [ '' ]);
		whenTextChangedDo: [ :newValue |
			self model labelFacts: newValue asString.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoFactsViewModel >> icon [ ^ OPDemoEditorIcons facts16Icon
]

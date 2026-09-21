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
	"Build declarative form fields for facts identification and label."
	super buildEditorForm: aForm.
	aForm bindTextInput: 'Name' property: #labelFacts
]

{ #category : 'accessing' }
OPDemoFactsViewModel >> icon [ ^ OPDemoEditorIcons facts16Icon
]

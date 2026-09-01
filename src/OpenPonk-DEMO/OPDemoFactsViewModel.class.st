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
	|text|
	text := self model labelFacts.
	super buildEditorForm: aForm.

	(aForm addText: 'Name')
		text: text;
		whenTextChangedDo: [ :newValue |
			self model labelFacts: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoFactsViewModel >> icon [ ^ OPDemoEditorIcons facts16Icon
]

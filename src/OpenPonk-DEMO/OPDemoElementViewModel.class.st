"
Abstract view model for DEMO node elements. Provides form building specifications and hierarchical information to the workbench and UI layers without direct GUI dependencies.
"
Class {
	#name : 'OPDemoElementViewModel',
	#superclass : 'OPModelObjectViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'testing' }
OPDemoElementViewModel class >> isAbstract [

	^ self = OPDemoElementViewModel
]

{ #category : 'accessing' }
OPDemoElementViewModel class >> modelClass [ ^ OPDemoElement
]

{ #category : 'forms' }
OPDemoElementViewModel >> buildEditorForm: aForm [
	
	(aForm addText: 'ID')
		text: self model name;
		whenTextChangedDo: [ :newValue |
			self model name: newValue asString.
			self modelChanged ].
]

{ #category : 'accessing' }
OPDemoElementViewModel >> childrenModels [ ^ self model incoming asArray , self model outgoing asArray
]

{ #category : 'accessing' }
OPDemoElementViewModel >> dependentElements [

	^ (self model incoming , self model outgoing) asSet
]

"
Abstract view model for DEMO transactions.
Exposes form building specifications, properties, and hierarchy logic to the workbench and UI layers.
"
Class {
	#name : 'OPDemoTransactionViewModel',
	#superclass : 'OPDemoElementViewModel',
	#category : 'OpenPonk-DEMO-ViewModels',
	#package : 'OpenPonk-DEMO',
	#tag : 'ViewModels'
}

{ #category : 'testing' }
OPDemoTransactionViewModel class >> isAbstract [

	^ self = OPDemoTransactionViewModel
]

{ #category : 'accessing' }
OPDemoTransactionViewModel class >> modelClass [ ^ OPDemoTransaction
]

{ #category : 'forms' }
OPDemoTransactionViewModel >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm addDroplist: 'Type')
		items: #('Ontological' 'Informational' 'Documental' 'Material');
		display: [ :type | type asString ];
		selectItem: self model type;
		whenSelectedItemChangedDo: [ :newValue |
			self model type: newValue.
			self modelChanged ].
	(aForm addTextInput: 'Product Kind')
		text: (self model productKind ifNil: [ '' ]);
		whenTextChangedDo: [ :newValue |
			self model productKind: newValue asString.
			self modelChanged ]
]

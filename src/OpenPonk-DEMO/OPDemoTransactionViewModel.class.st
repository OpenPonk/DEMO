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
	"Build declarative form fields for transaction type, product kind, and identification."
	super buildEditorForm: aForm.
	aForm
		bindDroplist: 'Type'
		property: #type
		items: #( 'Ontological' 'Informational' 'Documental' 'Material' ).
	aForm bindTextInput: 'Product Kind' property: #productKind
]

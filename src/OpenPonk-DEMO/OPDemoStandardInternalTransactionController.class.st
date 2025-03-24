Class {
	#name : 'OPDemoStandardInternalTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoStandardInternalTransactionController >> buildEditorForm: aForm [
	
	super buildEditorForm: aForm.

	(aForm addDroplist: 'Type')
		items: #('Ontological'  'Informational' 'Documental');
		display: [ :type | type asString ];
		selectItem: self model type;
		whenSelectedItemChangedDo: [ :newValue |
			self model type: newValue.
			self modelChanged ]
]

{ #category : 'construction' }
OPDemoStandardInternalTransactionController >> diagramElementClass [

	^ OPDemoStandardInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoStandardInternalTransactionController >> modelClass [
	^ OPDemoStandardInternalTransaction 
]

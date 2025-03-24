Class {
	#name : 'OPDemoMultipleInternalTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionController >> buildEditorForm: aForm [
	
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
OPDemoMultipleInternalTransactionController >> diagramElementClass [

	^ OPDemoMultipleInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionController >> modelClass [
	^ OPDemoMultipleInternalTransaction 
]

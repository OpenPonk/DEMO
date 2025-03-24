Class {
	#name : 'OPDemoMultipleCompositeTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionController >> buildEditorForm: aForm [
	
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
OPDemoMultipleCompositeTransactionController >> diagramElementClass [

	^ OPDemoMultipleCompositeTransactionShape 
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionController >> modelClass [
	^ OPDemoMultipleCompositeTransaction 
]

Class {
	#name : 'OPDemoTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoTransactionController >> buildEditorForm: aForm [
	
	super buildEditorForm: aForm.

	(aForm addDroplist: 'Type')
		items: #('Ontological'  'Informational' 'Documental' 'Material');
		display: [ :type | type asString ];
		selectItem: self model type;
		whenSelectedItemChangedDo: [ :newValue |
			self model type: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoTransactionController >> canBeSourceFor: aController [
	(self model owner isKindOf: OPDemoActor) ifTrue: [ ^ false ].
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoTransactionController >> canBeTargetFor: aController [ 
	
	(super canBeTargetFor: aController) ifFalse: [^ false].
	(self model owner isKindOf: OPDemoActor) ifTrue: [^ false].
	((aController isKindOf: OPDemoTargetInitiatorLinkController) or: (aController isKindOf: OPDemoSourceInitiatorLinkController)) ifFalse: [ ^ true ].
	^ aController source isKindOf: OPDemoActorController
]

{ #category : 'construction' }
OPDemoTransactionController >> diagramElementClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoTransactionController >> modelClass [
	^ self subclassResponsibility
]

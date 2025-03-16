Class {
	#name : 'OPDemoFactsController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoFactsController >> buildEditorForm: aForm [
	super buildEditorForm: aForm.

	(aForm addText: 'Label')
		whenTextChangedDo: [ :newValue |
			self model labelFacts: newValue.
			self modelChanged ]
]

{ #category : 'accessing' }
OPDemoFactsController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoFactsController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'construction' }
OPDemoFactsController >> diagramElementClass [

	^ OPDemoFactsShape 
]

{ #category : 'accessing' }
OPDemoFactsController >> modelClass [
	^ OPDemoFacts 
]

"
I implement a controller for a Fact Bank element
"
Class {
	#name : 'OPDemoFactsController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoFactsController >> buildEditorForm: aForm [
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
OPDemoFactsController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink]
]

{ #category : 'construction' }
OPDemoFactsController >> diagramElementClass [

	^ OPDemoFactsShape 
]

{ #category : 'accessing' }
OPDemoFactsController >> modelClass [
	^ OPDemoFacts 
]

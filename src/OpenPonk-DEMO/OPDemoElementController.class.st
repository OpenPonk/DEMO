"
I am a class representing an abstract controller for every node in the diagram
"
Class {
	#name : 'OPDemoElementController',
	#superclass : 'OPElementController',
	#instVars : [
		'element_id'
	],
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoElementController >> buildEditorForm: aForm [
	
	(aForm addText: 'ID')
		text: self model name;
		whenTextChangedDo: [ :newValue |
			self model name: newValue asString.
			self modelChanged ].
]

{ #category : 'accessing' }
OPDemoElementController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink]
]

{ #category : 'accessing' }
OPDemoElementController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'accessing' }
OPDemoElementController >> dependentElements [

	^ (self model incoming , self model outgoing) asSet
]

{ #category : 'construction' }
OPDemoElementController >> diagramElementClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoElementController >> modelClass [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoElementController >> removeModel [

	self model owner remove: self model.
	
	self diagramController model remove: self model.
	super removeModel
]

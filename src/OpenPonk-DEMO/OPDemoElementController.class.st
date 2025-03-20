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
OPDemoElementController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink)]]
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

	self diagramController model remove: self model.
	super removeModel
]

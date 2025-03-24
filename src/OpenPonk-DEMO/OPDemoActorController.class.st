Class {
	#name : 'OPDemoActorController',
	#superclass : 'OPDemoElementController',
	#instVars : [
		'transactionCount'
	],
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoActorController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoActorController >> canBeTargetFor: aController [
	((aController isKindOf: OPDemoStandardInternalTransactionController) and: (self model transactionCount = 0)) ifTrue: [ ^ true ]. 
	(super canBeTargetFor: aController) ifFalse: [^ false].
	((aController isKindOf: OPDemoTargetInitiatorLinkController) or: (aController isKindOf: OPDemoSourceInitiatorLinkController)) ifFalse: [ ^ true ].
	^ aController source isKindOf: OPDemoTransactionController
]

{ #category : 'construction' }
OPDemoActorController >> dependentElements [

	^ (self model incoming , self model outgoing) asSet
]

{ #category : 'construction' }
OPDemoActorController >> diagramElementClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OPDemoActorController >> modelClass [
	^ self subclassResponsibility
]

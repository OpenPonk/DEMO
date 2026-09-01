"
Abstract base controller for DEMO transactions.
Manages valid source and target connection rules and diagram interactions for transaction elements.
"
Class {
	#name : 'OPDemoTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'connecting' }
OPDemoTransactionController >> canBeSourceFor: aController [
	(self model owner isKindOf: OPDemoActor) ifTrue: [ ^ false ].
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'connecting' }
OPDemoTransactionController >> canBeTargetFor: aController [ 
	
	(super canBeTargetFor: aController) ifFalse: [^ false].
	(self model owner isKindOf: OPDemoActor) ifTrue: [^ false].
	((aController isKindOf: OPDemoTargetInitiatorLinkController) or: (aController isKindOf: OPDemoSourceInitiatorLinkController)) ifFalse: [ ^ true ].
	^ aController source isKindOf: OPDemoActorController
]

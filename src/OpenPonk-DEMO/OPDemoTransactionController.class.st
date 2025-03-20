Class {
	#name : 'OPDemoTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoTransactionController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoTransactionController >> canBeTargetFor: aController [ 
	
	(super canBeTargetFor: aController) ifFalse: [^ false].
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

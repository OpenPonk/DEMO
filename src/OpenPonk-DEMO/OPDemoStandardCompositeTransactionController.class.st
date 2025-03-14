Class {
	#name : 'OPDemoStandardCompositeTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoStandardCompositeTransactionController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'construction' }
OPDemoStandardCompositeTransactionController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'construction' }
OPDemoStandardCompositeTransactionController >> diagramElementClass [

	^ OPDemoStandardCompositeTransactionShape 
]

{ #category : 'accessing' }
OPDemoStandardCompositeTransactionController >> modelClass [
	^ OPDemoStandardCompositeTransaction 
]

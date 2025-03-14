Class {
	#name : 'OPDemoStandardInternalTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoStandardInternalTransactionController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'construction' }
OPDemoStandardInternalTransactionController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'construction' }
OPDemoStandardInternalTransactionController >> diagramElementClass [

	^ OPDemoStandardInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoStandardInternalTransactionController >> modelClass [
	^ OPDemoStandardInternalTransaction 
]

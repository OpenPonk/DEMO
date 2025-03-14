Class {
	#name : 'OPDemoMultipleInternalTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'construction' }
OPDemoMultipleInternalTransactionController >> diagramElementClass [

	^ OPDemoMultipleInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionController >> modelClass [
	^ OPDemoMultipleInternalTransaction 
]

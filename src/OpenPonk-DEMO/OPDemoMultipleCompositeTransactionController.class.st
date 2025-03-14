Class {
	#name : 'OPDemoMultipleCompositeTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionController >> canBeSourceFor: aController [
	^ (aController respondsTo: #modelClass) and:
	[aController modelClass = OPDemoAccessLink or:
	[(aController modelClass = OPDemoWaitingLink) or:
	[(aController modelClass = OPDemoTargetInitiatorLink) or: 
	[(aController modelClass = OPDemoSourceInitiatorLink)]]]]
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : 'construction' }
OPDemoMultipleCompositeTransactionController >> diagramElementClass [

	^ OPDemoMultipleCompositeTransactionShape 
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionController >> modelClass [
	^ OPDemoMultipleCompositeTransaction 
]

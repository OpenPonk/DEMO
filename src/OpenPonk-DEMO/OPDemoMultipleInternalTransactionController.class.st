"
I am a controller for a multiple internal Transaction
"
Class {
	#name : 'OPDemoMultipleInternalTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoMultipleInternalTransactionController >> diagramElementClass [

	^ OPDemoMultipleInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionController >> modelClass [
	^ OPDemoMultipleInternalTransaction 
]

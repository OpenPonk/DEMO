"
I am a controller for a standard internal Transaction
"
Class {
	#name : 'OPDemoStandardInternalTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoStandardInternalTransactionController >> diagramElementClass [

	^ OPDemoStandardInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoStandardInternalTransactionController >> modelClass [
	^ OPDemoStandardInternalTransaction 
]

"
I am a controller for a standard composite Transaction
"
Class {
	#name : 'OPDemoStandardCompositeTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoStandardCompositeTransactionController >> diagramElementClass [

	^ OPDemoStandardCompositeTransactionShape 
]

{ #category : 'accessing' }
OPDemoStandardCompositeTransactionController >> modelClass [
	^ OPDemoStandardCompositeTransaction 
]

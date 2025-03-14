Class {
	#name : 'OPDemoStandardCompositeTransactionController',
	#superclass : 'OPDemoElementController',
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

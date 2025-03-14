Class {
	#name : 'OPDemoStandardInternalTransactionController',
	#superclass : 'OPDemoElementController',
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

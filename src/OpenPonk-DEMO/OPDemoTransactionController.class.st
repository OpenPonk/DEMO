Class {
	#name : 'OPDemoTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPDemoTransactionController >> diagramElementClass [

	^ OPDemoStandardInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoTransactionController >> modelClass [
	^ OPDemoTransaction 
]

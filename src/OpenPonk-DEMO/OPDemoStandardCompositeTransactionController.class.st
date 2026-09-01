"
Controller for DEMO standard composite transactions.
Manages the diagram lifecycle, rendering interactions, and state synchronization for standard composite transactions.
"
Class {
	#name : 'OPDemoStandardCompositeTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoStandardCompositeTransactionController class >> diagramElementClass [

	^ OPDemoStandardCompositeTransactionShape 
]

{ #category : 'accessing' }
OPDemoStandardCompositeTransactionController class >> viewModelClass [
	^ OPDemoStandardCompositeTransactionViewModel
]

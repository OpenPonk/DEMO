"
Controller for DEMO standard internal transactions.
Manages the diagram lifecycle, rendering interactions, and state synchronization for standard internal transactions.
"
Class {
	#name : 'OPDemoStandardInternalTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoStandardInternalTransactionController class >> diagramElementClass [

	^ OPDemoStandardInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoStandardInternalTransactionController class >> viewModelClass [
	^ OPDemoStandardInternalTransactionViewModel
]

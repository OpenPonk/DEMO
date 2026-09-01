"
Controller for DEMO multiple internal transactions.
Manages the diagram lifecycle, rendering interactions, and state synchronization for multiple internal transactions.
"
Class {
	#name : 'OPDemoMultipleInternalTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoMultipleInternalTransactionController class >> diagramElementClass [

	^ OPDemoMultipleInternalTransactionShape 
]

{ #category : 'accessing' }
OPDemoMultipleInternalTransactionController class >> viewModelClass [
	^ OPDemoMultipleInternalTransactionViewModel
]

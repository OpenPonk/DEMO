"
Controller for DEMO multiple composite transactions.
Manages the diagram lifecycle, rendering interactions, and state synchronization for multiple composite transactions.
"
Class {
	#name : 'OPDemoMultipleCompositeTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoMultipleCompositeTransactionController class >> diagramElementClass [

	^ OPDemoMultipleCompositeTransactionShape 
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionController class >> viewModelClass [
	^ OPDemoMultipleCompositeTransactionViewModel
]

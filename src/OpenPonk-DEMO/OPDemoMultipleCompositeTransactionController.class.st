Class {
	#name : 'OPDemoMultipleCompositeTransactionController',
	#superclass : 'OPDemoTransactionController',
	#category : 'OpenPonk-DEMO-Controllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPDemoMultipleCompositeTransactionController >> diagramElementClass [

	^ OPDemoMultipleCompositeTransactionShape 
]

{ #category : 'accessing' }
OPDemoMultipleCompositeTransactionController >> modelClass [
	^ OPDemoMultipleCompositeTransaction 
]

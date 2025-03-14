Class {
	#name : 'OPDemoMultipleCompositeTransactionController',
	#superclass : 'OPDemoElementController',
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

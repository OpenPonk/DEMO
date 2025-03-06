Class {
	#name : 'OPDemoTransactionController',
	#superclass : 'OPDemoElementController',
	#category : 'OpenPonk-DEMO-DiagramControllers',
	#package : 'OpenPonk-DEMO',
	#tag : 'DiagramControllers'
}

{ #category : 'accessing' }
OPDemoTransactionController >> diagramElementClass [

	^ OPDemoTransactionController 
]

{ #category : 'accessing' }
OPDemoTransactionController >> modelClass [
	^ OPDemoTransaction 
]
